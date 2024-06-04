import 'package:flutter/material.dart';
import 'package:hotel_sunshine/models/room.dart';

class Reservation {
  DateTime checkIn;
  DateTime checkOut;
  Room room;

  Reservation({
    required this.checkIn,
    required this.checkOut,
    required this.room,
  });

  double get totalPrice {
    final days = checkOut.difference(checkIn).inDays;
    return days * room.pricePerNight;
  }
}
