import 'package:flutter/material.dart';
import 'package:qtree/components/diagram_two/diagram_two.dart';
import './diagram_two_view_model.dart';

class DiagramTwoView extends State<DiagramTwo> {
  DiagramTwoViewModel viewModel = DiagramTwoViewModel();

  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(body: diagram2());
  }

  Widget diagram2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            coloredContainer(Colors.red),
            coloredContainer(Colors.yellow),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            coloredContainer(Colors.red),
            coloredContainer(Colors.yellow)
          ],
        )
      ],
    );
  }

  Widget coloredContainer(Color givenColor) {
    return Container(
      color: givenColor,
      height: 40,
      width: 60,
    );
  }
}
