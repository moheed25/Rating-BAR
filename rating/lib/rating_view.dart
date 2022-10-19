import 'dart:math';

import 'package:flutter/material.dart';

class Rating_View extends StatefulWidget {
  const Rating_View({Key? key}) : super(key: key);

  @override
  State<Rating_View> createState() => _Rating_ViewState();
}

class _Rating_ViewState extends State<Rating_View> {
  var _ratingPageController = PageController();
  var _starPoaition = 200.0;
  var _rating = 0;
  var _selectedChipItem = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          //Thanks notes
          Container(
            height: max(300, MediaQuery.of(context).size.height * 0.3),
            child: PageView(
              controller: _ratingPageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildThanksNote(),
                _causeOfRating(),
              ],
            ),
          ),

          //Done button
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.red,
                child: MaterialButton(
                  onPressed: () {},
                  child: Text("Done"),
                  textColor: Colors.white,
                ),
              )),

          //Skip button
          Positioned(
            right: 0,
            child: MaterialButton(
              onPressed: () {},
              child: Text("Skip"),
            ),
          ),

          //Star rating
          AnimatedPositioned(
              top: _starPoaition,
              right: 0,
              left: 0,
              child: Row(
                  children: List.generate(
                5,
                (index) => IconButton(
                  onPressed: () {
                    _ratingPageController.nextPage(
                        duration: Duration(
                          milliseconds: 300,
                        ),
                        curve: Curves.easeIn);

                    setState(() {
                      _starPoaition = 20.0;
                      _rating = index + 1;
                    });
                  },
                  icon: index < _rating
                      ? Icon(
                          Icons.star,
                          size: 32,
                        )
                      : Icon(
                          Icons.star_border,
                          size: 32,
                        ),
                  color: Colors.red,
                ),
              )),
              duration: Duration(
                milliseconds: 300,
              ))
        ],
      ),
    );
  }

  _buildThanksNote() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Thanks for riding on bus on demand",
          style: TextStyle(
            fontSize: 24,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text("We\'d love to  get your feedback"),
        Text('How was your ride today?'),
      ],
    );
  }

  _causeOfRating() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
            visible: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("What could be better ?"),
                Wrap(
                  spacing: 8.0,
                  alignment: WrapAlignment.center,
                  children: List.generate(
                      6,
                      (index) => InkWell(
                            onTap: () {
                              setState(() {
                                _selectedChipItem = index;
                              });
                            },
                            child: Chip(
                                backgroundColor: _selectedChipItem == index
                                    ? Colors.red
                                    : Colors.grey[300],
                                label: Text('Text ${index + 1}')),
                          )),
                ),
              ],
            ))
      ],
    );
  }
}
