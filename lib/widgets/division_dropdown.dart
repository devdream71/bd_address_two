import 'package:bd_address_two/models/division.dart';
import 'package:bd_address_two/services/division_service.dart';
import 'package:flutter/material.dart';
 

class DivisionDropdown extends StatefulWidget {
  const DivisionDropdown({super.key});

  @override
  DivisionDropdownState createState() => DivisionDropdownState();
}

class DivisionDropdownState extends State<DivisionDropdown> {
  late Future<List<Division>> _divisionsFuture;
  Division? _selectedDivision;

  @override
  void initState() {
    super.initState();
    _divisionsFuture = DivisionService().fetchDivisions();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("fghghfd"),
        FutureBuilder<List<Division>>(
          future: _divisionsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
        
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
        
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No divisions available');
            }
        
            final divisions = snapshot.data!;
        
            return DropdownButton<Division>(
              value: _selectedDivision,
              hint: const Text('Select Division'),
              onChanged: (Division? newDivision) {
                setState(() {
                  _selectedDivision = newDivision;
                });
              },
              items: divisions.map((Division division) {
                return DropdownMenuItem<Division>(
                  value: division,
                  child: Text(division.name),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}