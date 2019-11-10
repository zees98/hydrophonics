import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hydrophonics/crop.dart';


class SelectionScreen extends StatefulWidget {
  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.settings),
        onPressed: (){
          showDialog(
            context: context,
            builder: (context){
              
              return AlertBox();
            }
          );
        },
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.elliptical(790, 500),
                    topLeft: Radius.elliptical(800, 580))),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  FlatButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CropScreen();
                    })),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Image.asset('assets/crops.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(AlertBox.isEng?'Choose Crops': 'اختيار المحاصيل')
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CropScreen();
                    })),
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(AlertBox.getLang()?'View Fertilizers': 'عرض الأسمدة' ),
                          SizedBox(
                            width: 50,
                          ),
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Image.asset('assets/fertilizer.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AlertBox extends StatefulWidget {
  static bool  isEng = true;
  static bool getLang()  => isEng;
  AlertBox({
    Key key,
  }) : super(key: key);

  @override
  _AlertBoxState createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  
  
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      
      title: Text('Settings'),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(AlertBox.isEng? "English": "Arabic"),
              Switch(
                value: AlertBox.isEng,
                onChanged: (val){
                  setState(() {
                    AlertBox.isEng = val;
                    print(val); 
                  });
                  Navigator.pop(context);
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
