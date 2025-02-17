import 'package:flutter/material.dart';

void main() {
  runApp(BusSeatsApp());
}

class BusSeatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BusSeats(),
    );
  }
}

class BusSeats extends StatefulWidget {
  const BusSeats({super.key});

  @override
  State<BusSeats> createState() => _BusSeatsState();
}

class _BusSeatsState extends State<BusSeats> {
  // Custom seat layout (1 = seat, "a" = aisle, 2 = special seat)
  final List<List<dynamic>> seatLayout = [
    [1, 1, "a", "a", 2],
    [1, 1, "a", 1, 1],
    ["a", "a", "a", 1, 1],
    [1, 1, "a", 1, 1],
    [1, 1, "a", 1, 1],
    [1, 1, "a", 1, 1],
    [1, 1, "a", 1, 1],
    [1, 1, 1, 1, 1],
  ];

  // Mapping seat selection
  List<List<bool>> selectedSeats = [];

  @override
  void initState() {
    super.initState();
    selectedSeats = List.generate(seatLayout.length,
        (row) => List.generate(seatLayout[row].length, (col) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Arranged Bus Seats')),
      body: Column(
          // Centers everything on the screen
          children: [
            Center(
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Prevents extra spacing
                  children: List.generate(seatLayout.length, (rowIndex) {
                    return Row(
                      mainAxisSize: MainAxisSize
                          .min, // Ensures row takes only needed width
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(seatLayout[rowIndex].length,
                          (colIndex) {
                        var seat = seatLayout[rowIndex][colIndex];

                        // Handle aisle space
                        if (seat == "a") {
                          return SizedBox(width: 40);
                        }
                        if (seat == 2) {
                          return Icon(Icons.event_seat,
                              size: 40, color: Colors.green);
                        }

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSeats[rowIndex][colIndex] =
                                  !selectedSeats[rowIndex][colIndex];
                            });
                          },
                          child: Icon(
                            Icons.event_seat,
                            size: 40,
                            color: selectedSeats[rowIndex][colIndex]
                                ? Colors.red
                                : Colors.blue,
                          ),
                        );
                      }),
                    );
                  }),
                ),
              ),
            ),
          ]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Selected seats: ${selectedSeats.expand((row) => row).where((seat) => seat).length}',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
