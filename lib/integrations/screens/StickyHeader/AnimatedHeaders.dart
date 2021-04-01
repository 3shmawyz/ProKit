import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/sticky_header/sticky_headers/widget.dart';

class AnimatedHeaders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8998FF),
        title: Text('Animated Headers with Content'),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return StickyHeaderBuilder(
          builder: (BuildContext context, double stuckAmount) {
            // To set the animation of the header
            stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
            return Container(
              height: 50.0,
              color: Color.lerp(Colors.blue[700], Colors.red[700], stuckAmount),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Header #$index',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Offstage(
                    offstage: stuckAmount <= 0.0,
                    child: Opacity(
                      opacity: stuckAmount,
                      child: IconButton(
                        icon: Icon(Icons.favorite, color: Colors.white),
                        onPressed: () => Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Favorite #$index'))),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          content: Container(
            child: Image.network(
                'https://killerattitudestatus.in/wp-content/uploads/2019/12/gud-night-images.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200.0),
          ),
        );
      }),
    );
  }
}
