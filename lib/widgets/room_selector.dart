import 'package:flutter/material.dart';
import 'package:hotel_sunshine/providers/hotel_provider.dart';
import 'package:provider/provider.dart';


class RoomSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HotelProvider>(
      builder: (context, hotelProvider, child) {
        return Column(
          children: ['Sem Suíte', 'Com Suíte'].map((roomType) {
            final isSelected = hotelProvider.selectedRoomType == roomType;
            return ListTile(
              title: Text(roomType),
              trailing: Text(roomType == 'Com Suíte' ? '\$150.0' : '\$100.0'),
              tileColor: isSelected ? Colors.blue.withOpacity(0.2) : null,
              onTap: () {
                hotelProvider.selectRoomType(roomType);
              },
            );
          }).toList(),
        );
      },
    );
  }
}