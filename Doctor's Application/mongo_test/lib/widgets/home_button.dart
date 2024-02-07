import 'package:flutter/material.dart';
import 'package:mongo_test/routes/mapping.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchURL(String url) async {
  final Uri _url = Uri.parse(url);
  if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $_url');
  }
}

class MyButton extends StatelessWidget {
  final boxColor;
  final label;
  final image;
  final route;
  final isRoute;
  const MyButton(
      {Key? key,
      required this.boxColor,
      required this.label,
      required this.image,
      required this.route,
      required this.isRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          isRoute == 1
              ? Navigator.pushNamed(context, MyRoutes.patientsRoute)
              : _launchURL(route);
        },
        child: Container(
            width: 0.4 * (MediaQuery.of(context).size.width),
            height: (143 / 932) * (MediaQuery.of(context).size.height),
            decoration: BoxDecoration(
              color: Color(boxColor),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 27),
              child: Column(
                children: [
                  Image.asset(image),
                  Text(
                    label,
                    style: TextStyle(fontSize: 21),
                  ),
                ],
              ),
            )));
  }
}
