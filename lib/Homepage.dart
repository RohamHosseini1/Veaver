import 'package:flutter/material.dart';
import 'package:hello_world/MockAuthRepository.dart';
import 'dart:math';
import 'dart:async';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Veaver'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text('Video'),
                onPressed: () {},
              ),
              ElevatedButton(
                child: Text('Podcast'),
                onPressed: () {},
              ),
              ElevatedButton(
                child: Text('Blog'),
                onPressed: () {},
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: Text(
                      'Event one',
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: Text(
                      'Event one',
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: Text(
                      'Event one',
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Stack(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text('Current '),
                            color: Colors.blue,
                            height: 200,
                            width: 800,
                          ),
                          ElevatedButton(
                            child: Text('Should we eat meat?'),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    child: Text('Backlog '),
                    color: Colors.yellow,
                    height: 200,
                    width: 800,
                  ),
                  Container(
                    child: Text('Library '),
                    color: Colors.red,
                    height: 200,
                    width: 800,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
