import 'package:flutter/material.dart';
import 'package:qtree/components/diagram_one/diagram_one.dart';
import './diagram_one_view_model.dart';

// View => UI components
class DiagramOneView extends State<DiagramOne> {
  DiagramOneViewModel? viewModel;
  DiagramOneView() {
    viewModel = DiagramOneViewModel();
  }
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            IconButton(
                onPressed: navigateBack, icon: Icon(Icons.arrow_back_ios)),
            diagram1(),
          ],
        ),
      ),
    );
  }

  navigateBack() {
    Navigator.pop(context);
  }

  Widget diagram1() {
    return Column(
      // alignment: Alignment.centerRight,
      children: <Widget>[
        coloredContainer(Colors.red),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            coloredContainer(Colors.yellow),
            coloredContainer(Colors.yellow)
          ],
        ),
        coloredContainer(Colors.red)
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
