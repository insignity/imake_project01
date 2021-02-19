import 'package:flutter/material.dart';

import '../models/order.dart';

List orders = <Order>[
  Order(
    title: 'Брови, ресницы, ногти',
    author: 'Александра',
    description: 'На дом: ул. Ленина 98',
    avatar: AssetImage('assets/images/people/1.png'),
    price: 900,
  ),
  Order(
    title: 'На вечер: Прическа, макияж, ногти',
    author: 'Нина',
    description: 'На дом: ул. Орджиникидзе 12',
    avatar: AssetImage('assets/images/people/2.png'),
    price: 1200,
  ),
  Order(
    title: 'Нужен парикмахер',
    author: 'Виктория',
    description: 'На дом: ул. Лермонтова 99/2',
    avatar: AssetImage('assets/images/people/3.png'),
    price: 700,
  ),
  Order(
    title: 'Нужен парикмахер',
    author: 'Петр',
    description: 'На вашей территории',
    avatar: AssetImage('assets/images/people/4.png'),
    price: 800,
  ),
  Order(
    title: 'Нужен парикмахер',
    author: 'Анатолий',
    description: 'На вашей территории',
    avatar: AssetImage('assets/images/people/5.png'),
    price: 500,
  ),
];
