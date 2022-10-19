import 'package:flutter/material.dart';
import 'package:rating/rating_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: Column(
            children: [
              FlutterLogo(
                size: 100,
              ),
              Text("Awsome My App",
                  style: Theme.of(context).textTheme.headline3),
              Spacer(),
              TextButton.icon(
                  onPressed: () {
                    openRatingDialog(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.blue.withOpacity(0.2),
                    ),
                  ),
                  icon: Icon(Icons.star),
                  label: Text(
                    "Rate Us",
                    style: Theme.of(context).textTheme.headline6,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  openRatingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              child: Rating_View(),
            ),
          );
        });
  }
}
