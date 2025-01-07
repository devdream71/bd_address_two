// import 'dart:convert';

// import 'package:bd_address_two/models/division.dart';
// import 'package:flutter/services.dart';
 

// class DivisionService {
//   Future<List<Division>> fetchDivisions() async {
//     final String response = await rootBundle.loadString('assets/divisions.json');
//     final data = json.decode(response);

//     final List<dynamic> divisionsJson = data['divisions'];
//     return divisionsJson.map((json) => Division.fromJson(json)).toList();
//   }
// }