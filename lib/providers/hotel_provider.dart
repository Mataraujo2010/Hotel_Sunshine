import 'package:flutter/material.dart';

class Reservation {
  final String name;
  final String roomType;
  final DateTime checkIn;
  final DateTime checkOut;
  final double totalPrice;

  Reservation({
    required this.name,
    required this.roomType,
    required this.checkIn,
    required this.checkOut,
    required this.totalPrice,
  });
}

class HotelProvider with ChangeNotifier {
  String _selectedRoomType = 'Sem Suíte';
  DateTime? _checkIn;
  DateTime? _checkOut;
  double _roomPrice = 100.0;
  String _customerName = '';
  List<Reservation> _reservations = [];

  String get selectedRoomType => _selectedRoomType;
  DateTime? get checkIn => _checkIn;
  DateTime? get checkOut => _checkOut;
  double get roomPrice => _roomPrice;
  String get customerName => _customerName;
  List<Reservation> get reservations => _reservations;

  void selectRoomType(String roomType) {
    _selectedRoomType = roomType;
    _roomPrice = roomType == 'Com Suíte' ? 150.0 : 100.0;
    notifyListeners();
  }

  void selectCheckInDate(DateTime date) {
    _checkIn = date;
    notifyListeners();
  }

  void selectCheckOutDate(DateTime date) {
    _checkOut = date;
    notifyListeners();
  }

  void setCustomerName(String name) {
    _customerName = name;
    notifyListeners();
  }

  double get totalPrice {
    if (_checkIn != null && _checkOut != null) {
      final days = _checkOut!.difference(_checkIn!).inDays;
      return days * _roomPrice;
    }
    return 0.0;
  }

  void addReservation() {
    if (_checkIn != null && _checkOut != null && _customerName.isNotEmpty) {
      final reservation = Reservation(
        name: _customerName,
        roomType: _selectedRoomType,
        checkIn: _checkIn!,
        checkOut: _checkOut!,
        totalPrice: totalPrice,
      );
      _reservations.add(reservation);
      notifyListeners();
    }
  }
}
