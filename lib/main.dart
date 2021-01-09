import 'package:flutter/material.dart';
import 'package:navigation_bar_flutter/home.dart';
import 'package:navigation_bar_flutter/profile.dart';
import 'package:navigation_bar_flutter/setting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

 @override
 _Myappstate createState()=> _Myappstate();

  }
  class _Myappstate extends State<MyApp>{
  int index =0;
  List<Widget> list =[
    Home(),
    Profile(),
    Setting()
  ];

  @override
    // TODO: implement widget
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("hello Flutter"),
        ),
        body: list[index],
        drawer: MyDrawer(onTap: (ctx,i){
          setState(() {
            index=i;
            Navigator.pop(ctx);
          });
    },      ),
      ),
    );
  }
  }
  class MyDrawer extends StatelessWidget {
  final Function onTap;
  MyDrawer({
    this.onTap
  });
    @override
    Widget build(BuildContext context) {
      return SizedBox(
        width: MediaQuery.of(context).size.width*0.8,
        child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color:Colors.blue),
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: 60,
                        height: 60,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/india.png'),

                        ),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        'hemant kumar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white

                        ),
                      ),
                      SizedBox(height: 3,),
                      Text(
                        'Lucky roy',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                        ),
                      )
                    ]
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: ()=>onTap(context,0),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Profile'),
                onTap: ()=>onTap(context,1),
              ),ListTile(
                leading: Icon(Icons.person),
                title: Text('Setting'),
                onTap: ()=>onTap(context,2),
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Log out'),
                onTap: ()=>onTap(context,0),
              )
            ]
          ),
        ),
      );
    }
  }
  



