import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchURL(String url) async {
  final Uri _url = Uri.parse(url);
  if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $_url');
  }
}

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 0.75 * (MediaQuery.of(context).size.width),
        backgroundColor: Color(0xFF2A2A2A),
        child: Container(
            child: ListView(
          padding: EdgeInsets.only(top: 70, left: 15, right: 15),
          children: [
            Row(
              children: [
                CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        AssetImage('lib/images/profile_photo.png')),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Divyansh Gupta',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 5, top: 5),
                        child: Text(
                          'Health Status: Good',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ))
                  ],
                )
              ],
            ),
            SizedBox(height: 50),
            Container(width: 288, child: Divider()),
            SizedBox(height: 15),
            ListTile(
              leading: Icon(Icons.home_filled, color: Colors.white),
              title: Text("Home",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Container(
                width: 25.0,
                height: 25.0,
                child: Image.asset(
                  'lib/images/reports.png',
                  fit: BoxFit.cover,
                ),
              ),
              title: Text("Reports",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              onTap: () {
                _launchURL('https://srivas-divyansh.github.io/blockchain_bnb/');
              },
            ),
            ListTile(
              leading: Container(
                width: 30.0,
                height: 30.0,
                child: Image.asset(
                  'lib/images/predict_drawer.png',
                ),
              ),
              title: Text("Predict",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              onTap: () {
                _launchURL('https://diseasepredictionml-dl.onrender.com/');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text("Log Out",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 26),
            Container(width: 288, child: Divider()),
          ],
        )));
  }
}
