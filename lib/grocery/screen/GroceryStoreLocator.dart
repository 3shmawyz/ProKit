import 'dart:async';

import 'package:clustering_google_maps/clustering_google_maps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/grocery/model/grocery_allStores_model.dart';
import 'package:prokit_flutter/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/grocery/utils/GroceryExtension.dart';
import 'package:prokit_flutter/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/grocery/utils/grocery_common.dart';

class GroceryStoreLocatorScreen extends StatefulWidget {
  static String tag = '/GroceryStoreLocatorScreen';

  @override
  _GroceryStoreLocatorScreenState createState() => _GroceryStoreLocatorScreenState();
}

class _GroceryStoreLocatorScreenState extends State<GroceryStoreLocatorScreen> {
  List<AllStores> listAllStores = allStores;
  Completer<GoogleMapController> _controller = Completer();

  ClusteringHelper clusteringHelper;
  List<LatLngAndGeohash> list;

  List<Marker> markers = List();
  var mMapType = MapType.normal;

  initMemoryClustering(context) async {
    list = await getListOfLatLngAndGeoHash(context);
    clusteringHelper = ClusteringHelper.forMemory(
      list: list,
      updateMarkers: updateMarkers,
      aggregationSetup: AggregationSetup(markerSize: 150), // You can customize marker size, colors and size limits
    );
    setState(() {});
  }

  updateMarkers(Set<Marker> markers) {
    this.markers = markers.toList();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    initMemoryClustering(context);
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialPosition = CameraPosition(
      target: LatLng(43.7262115, 12.636526499999945),
      zoom: 5,
    );

    CameraPosition newPosition = CameraPosition(bearing: 192.8334901395799, target: LatLng(37.43296265331129, -122.08832357078792), tilt: 59.440717697143555, zoom: 19.151926040649414);

    final allStores = ListView.builder(
        itemCount: listAllStores.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            decoration: boxDecoration(showShadow: true),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      color: grocery_colorPrimary,
                      child: Icon(
                        Icons.location_on,
                        color: grocery_color_white,
                      ),
                    ).cornerRadiusWithClipRRect(25),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text(
                            listAllStores[index].storeName,
                            fontSize: textSizeNormal,
                            fontFamily: fontMedium,
                          ).paddingOnly(bottom: 16),
                          text(
                            listAllStores[index].storeAddress,
                            fontSize: textSizeMedium,
                            fontFamily: fontMedium,
                          ),
                        ],
                      ).paddingOnly(left: 16, right: 16),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: SizedBox()),
                    button(context, grocery_direction, backgroundColor: grocery_blue, height: 40, width: 150),
                    button(context, grocery_call, backgroundColor: grocery_colorPrimary, height: 40, width: 100),
                  ],
                ).paddingOnly(top: 16)
              ],
            ).paddingOnly(left: 16, right: 16, top: 16, bottom: 16),
          ).paddingOnly(left: 16, right: 16, top: 16).onTap(() {});
        });

    final nearby = GoogleMap(
      compassEnabled: true,
      indoorViewEnabled: true,
      trafficEnabled: true,
      mapType: mMapType,
      markers: markers.toSet(),
      onCameraMove: (newPosition) => clusteringHelper.onCameraMove(newPosition, forceUpdate: false),
      onCameraIdle: clusteringHelper != null ? clusteringHelper.onMapIdle : null,
      initialCameraPosition: initialPosition,
      onTap: _handleTap,
      onMapCreated: (GoogleMapController controller) {
        clusteringHelper.mapController = controller;
        _controller.complete(controller);
        clusteringHelper.updateMap();
      },
    );

    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(120),
              child: Container(
                color: grocery_colorPrimary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            back(context);
                          },
                          icon: Icon(
                            Icons.clear,
                            size: 30,
                            color: grocery_color_white,
                          ),
                        ).paddingOnly(right: 24),
                        Expanded(child: text(grocery_storeLocator, fontSize: textSizeNormal, textColor: grocery_color_white, fontFamily: fontBold)),
                        Icon(
                          Icons.search,
                          size: 30,
                          color: grocery_color_white,
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: TabBar(
                        indicatorWeight: 4.0,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: grocery_color_white,
                        labelColor: grocery_color_white,
                        isScrollable: false,
                        unselectedLabelColor: grocery_color_white.withOpacity(0.5),
                        onTap: (index) {
                          if (index == 0) {
                            print('Hellooo');
                          } else if (index == 1) {
                            initMemoryClustering(context);
                          }
                        },
                        tabs: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              grocery_allStores,
                              style: TextStyle(fontSize: textSizeMedium),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              grocery_nearby,
                              style: TextStyle(fontSize: textSizeMedium),
                            ),
                          ),
                        ],
                      ),
                    ).paddingOnly(top: 24),
                  ],
                ).paddingOnly(left: 12, right: 16),
              ),
            ),
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[allStores, nearby],
            ),
          ),
        ),
      ),
    );
  }

  getLocation(LatLng point) async {
    var coordinates = Coordinates(point.latitude, point.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return addresses.first.addressLine;
  }

  void _handleTap(LatLng point) async {
    toast('Fetching Location');
    var location = await getLocation(point);
    setState(() {
      markers.add(Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        draggable: true,
        infoWindow: InfoWindow(
          title: location,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ));
    });
  }
}
