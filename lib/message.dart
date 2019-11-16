import 'package:flutter/material.dart';
import 'package:hydrophonics/main.dart';

class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
         clipper: MessageCClipper(),
                  child: Container(
            height: 100,
            width: 250,
            //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            color: Colors.white,
            child: Text("Message 1"),
          ),
        ),
      ),
    );
  }
}
class MessageCClipper extends CustomClipper<Path>{
  @override
  final Path path = Path();
  Path getClip(Size size) {
    
    //path.lineTo(20, 0);
    path.lineTo(50  , 150);
    path.lineTo(50, 10);
    path.cubicTo(size.width/2 ,50, size.width/ 2, size.height / 2, 30, 80);
    path.close();
    // TODO: implement getClip
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}