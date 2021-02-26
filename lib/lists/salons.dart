import 'package:flutter/material.dart';
import 'package:real/models/worker.dart';
import 'services.dart';

final salons = <Worker>[
  Worker(
    title: services[0] + ", " + services[1] + ", " + services[2],
    author: 'Нефертити',
    description: 'test1',
    level: 'Advanced',
    avatar: AssetImage('assets/images/people/12.PNG'),
  ),
  Worker(
      title: services[1] + ", " + nails[2] + ", " + nails[3],
      author: 'Барбер Якт',
      description: 'test2',
      level: 'Intermediate',
      avatar: AssetImage('assets/images/people/13.PNG')),
  Worker(
      title: services[0] + ", " + hairs[2] + ", " + hairs[3],
      author: 'ТопГан',
      description: 'test3',
      level: 'Beginner',
      avatar: AssetImage('assets/images/people/14.PNG')),
];
