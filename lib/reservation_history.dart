import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hotel_sunshine/providers/hotel_provider.dart';

class ReservationHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HotelProvider>(
      builder: (context, hotelProvider, child) {
        return ListView.builder(
          itemCount: hotelProvider.reservations.length,
          itemBuilder: (context, index) {
            final reservation = hotelProvider.reservations[index];
            return ListTile(
              title: Text('${reservation.name} - ${reservation.roomType}'),
              subtitle: Text('Check-in: ${reservation.checkIn.toLocal()} | Check-out: ${reservation.checkOut.toLocal()}'),
              trailing: Text('Total: \$${reservation.totalPrice.toStringAsFixed(2)}'),
            );
          },
        );
      },
    );
  }
}
