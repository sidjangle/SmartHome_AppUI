import 'package:flutter/material.dart';
import 'package:smart_home/MyDeviceWidget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List data = [
    {"name": "Light", "color": Color(0xffffcf4c), "icon": Icons.lightbulb},
    {"name": "Media", "color": Color(0xff80a0ff), "icon": Icons.movie},
    {"name": "Camera", "color": Color(0xffff808d), "icon": Icons.camera},
    {"name": "Wi-Fi", "color": Color(0xff77d977), "icon": Icons.wifi},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffdfdfd),
        appBar: AppBar(
          leading: Icon(
            Icons.sort,
            size: 30,
          ),
          actions: [
            CircleAvatar(radius: 30, child: Image.asset('assets/codetodo.jpg'))
          ],
          shadowColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'My Smart Home',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            Container(
              height: 190,
              child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                      childAspectRatio: 2.7),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Icon(
                              data[index]['icon'],
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: data[index]['color']),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              data[index]['name'],
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Living Room',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              subtitle: Text('2 devices '),
            ),
            MyDeviceWidget(),
          ],
        ),
        floatingActionButton:
            FloatingActionButton(onPressed: () {}, child: Icon(Icons.mic)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomSheet: BottomAppBar(
          notchMargin: 10,
          child: Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade100, spreadRadius: 5, blurRadius: 5)
            ]),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.home_max,
                  size: 30,
                ),
                Icon(
                  Icons.settings,
                  size: 30,
                )
              ],
            ),
          ),
        ));
  }
}
