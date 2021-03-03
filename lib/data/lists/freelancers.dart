import 'package:flutter/material.dart';
import 'package:real/entity/worker.dart';

import 'services.dart';

final freelancers = <Worker>[
  Worker(
    title: 'Брови, ресницы, ногти',
    author: 'Мария',
    description: 'test1',
    level: 'Beginner',
    avatar: AssetImage('assets/images/people/7.PNG'),
  ),
  Worker(
      title: services[1] + ", " + nails[2] + ", " + nails[3],
      author: 'Татьяна',
      description: 'test2',
      level: 'Intermediate',
      avatar: AssetImage('assets/images/people/8.PNG')),
  Worker(
      title: services[0] + ", " + hairs[2] + ", " + hairs[3],
      author: 'Александр',
      description: 'test3',
      level: 'Beginner',
      avatar: AssetImage('assets/images/people/9.PNG')),
  Worker(
      title: services[2] + ", " + lashes[2] + ", " + lashes[3],
      author: 'Наталья',
      description: 'test4',
      level: 'Intermediate',
      avatar: AssetImage('assets/images/people/10.PNG')),
  Worker(
      title: services[2] + ", " + services[1] + ", " + services[0],
      author: 'Григорий',
      description: 'test5',
      level: 'Advanced',
      avatar: AssetImage('assets/images/people/11.PNG')),
];
