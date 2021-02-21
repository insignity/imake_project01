import 'package:flutter/material.dart';

import '../models/order.dart';

List orders = <Order>[
  Order(
    title: 'Брови, ресницы, ногти',
    author: 'Александра',
    address: 'На дом: ул. Ленина 98',
    date: 'Сейчас',
    avatar: AssetImage('assets/images/people/1.png'),
    price: 900,
  ),
  Order(
    title: 'На вечер: Прическа, макияж, ногти',
    author: 'Нина',
    address: 'На дом: ул. Орджиникидзе 12',
    date: 'Сейчас',
    avatar: AssetImage('assets/images/people/2.png'),
    price: 1200,
  ),
  Order(
    title: 'Нужен парикмахер',
    author: 'Виктория',
    address: 'На дом: ул. Лермонтова 99/2',
    date: 'Сейчас',
    avatar: AssetImage('assets/images/people/3.png'),
    price: 700,
  ),
  Order(
    title: 'Нужен парикмахер',
    author: 'Петр',
    address: 'На вашей территории',
    date: 'Сейчас',
    avatar: AssetImage('assets/images/people/4.png'),
    price: 800,
  ),
  Order(
    title: 'Нужен парикмахер',
    author: 'Анатолий',
    address: 'На вашей территории',
    date: 'Сейчас',
    avatar: AssetImage('assets/images/people/5.png'),
    price: 500,
  ),
];
