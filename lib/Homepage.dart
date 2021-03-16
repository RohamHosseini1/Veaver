import 'dart:html';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('Veaver')
      ),
      //body: SingleChildScrollView (
       // scrollDirection: axis.vertical,
        //child: Column(children: [
         // TaskWidget(),


        );
        


        
        
        

    
  }

  Class TaskWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          Text('Video'),
          Text('Podcast'),
          Text('Blog'),
          Row(children: [
             

          ],)
        ],
      );
    }
  } 

class StoryWidget extends StatelessWidget {
  final Axis direction;

  StoryWidget({
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Discovery',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 24),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Flex(
            direction: direction,
            mainAxisSize: MainAxisSize.max,
            children: [
              
            ],
          ),
        ),
      ],
    );
  }
}



  }