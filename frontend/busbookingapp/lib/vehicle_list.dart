import 'package:flutter/material.dart';

class VehicleList extends StatelessWidget {
  const VehicleList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> vehicles = ['Bus 1', 'Bus 2', 'Bus 3', 'Bus 4'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicle List'),
      ),
      body: ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(vehicles[index]),
          );
        },
      ),
    );
  }
}
