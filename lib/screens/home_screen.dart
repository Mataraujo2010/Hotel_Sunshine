import 'package:flutter/material.dart';
import 'package:hotel_sunshine/reservation_history.dart';
import 'package:provider/provider.dart';
import 'package:hotel_sunshine/providers/hotel_provider.dart';
import 'package:hotel_sunshine/widgets/room_selector.dart';
import 'package:hotel_sunshine/widgets/date_selector.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hotel Sunshine')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nome do Cliente'),
              onChanged: (value) {
                Provider.of<HotelProvider>(context, listen: false).setCustomerName(value);
              },
            ),
            SizedBox(height: 20),
            RoomSelector(),
            SizedBox(height: 20),
            DateExpansionTile(isCheckIn: true, title: 'Selecione a data de check-in:'),
            SizedBox(height: 20),
            DateExpansionTile(isCheckIn: false, title: 'Selecione a data de check-out:'),
            SizedBox(height: 20),
            Consumer<HotelProvider>(
              builder: (context, hotelProvider, child) {
                return Text('Preço total: \$${hotelProvider.totalPrice.toStringAsFixed(2)}');
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<HotelProvider>(context, listen: false).addReservation();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Reserva Confirmada'),
                    content: Text('Obrigado pela sua reserva!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Fechar'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Submeter Reserva'),
            ),
            SizedBox(height: 20),
            Text('Histórico de Reservas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(child: ReservationHistory()),
          ],
        ),
      ),
    );
  }
}