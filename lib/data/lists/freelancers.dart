import 'package:flutter/material.dart';
import 'package:real/entity/service.dart';
import 'package:real/entity/worker.dart';

import 'services.dart';

final services1 = <Service>[
  Service(
      name: "Ресницы",
      image: AssetImage("assets/images/services/11.jpg"),
      price: 500),
  Service(
      name: "Ногти",
      image: AssetImage("assets/images/services/1.jpg"),
      price: 1500),
];
final services2 = <Service>[
  Service(
      name: "Ногти",
      image: AssetImage("assets/images/services/2.jpg"),
      price: 1200),
  Service(
      name: "Ресницы",
      image: AssetImage("assets/images/services/22.JPG"),
      price: 400),
];
final services3 = <Service>[
  Service(
      name: "Ногти",
      image: AssetImage("assets/images/services/3.JPG"),
      price: 1200),
  Service(
      name: "Ресницы",
      image: AssetImage("assets/images/services/33.JPG"),
      price: 400),
];
final services4 = <Service>[
  Service(
      name: "Ногти",
      image: AssetImage("assets/images/services/4.JPG"),
      price: 1200),
  Service(
      name: "Ресницы",
      image: AssetImage("assets/images/services/44.JPG"),
      price: 400),
];
final services5 = <Service>[
  Service(
      name: "Ногти",
      image: AssetImage("assets/images/services/5.JPG"),
      price: 1200),
  Service(
      name: "Ресницы",
      image: AssetImage("assets/images/services/55.JPG"),
      price: 400),
];

final freelancers = <Worker>[
  Worker(
    title: 'Брови, ресницы, ногти',
    author: 'Мария',
    description: 'test1',
    level: 'Beginner',
    avatar: AssetImage('assets/images/people/7.PNG'),
    services: services1,
  ),
  Worker(
      title: services[1] + ", " + nails[2] + ", " + nails[3],
      author: 'Татьяна',
      description: 'test2',
      level: 'Intermediate',
      avatar: AssetImage('assets/images/people/8.PNG'),
      services: services2),
  Worker(
      title: services[0] + ", " + hairs[2] + ", " + hairs[3],
      author: 'Александр',
      description: 'test3',
      level: 'Beginner',
      avatar: AssetImage('assets/images/people/9.PNG'),
      services: services3),
  Worker(
      title: services[2] + ", " + lashes[2] + ", " + lashes[3],
      author: 'Наталья',
      description: 'test4',
      level: 'Intermediate',
      avatar: AssetImage('assets/images/people/10.PNG'),
      services: services4),
  Worker(
      title: services[2] + ", " + services[1] + ", " + services[0],
      author: 'Григорий',
      description: 'test5',
      level: 'Advanced',
      avatar: AssetImage('assets/images/people/11.PNG'),
      services: services5),
];
