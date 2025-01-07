// import 'package:bd_address_two/models/division.dart';
// import 'package:flutter/material.dart';

// import '../data/divisions_data.dart'; // Original JSON data

// class DivisionDropdown extends StatefulWidget {
//   final bool useBangla;

//   const DivisionDropdown({super.key, this.useBangla = false});

//   @override
//   DivisionDropdownState createState() => DivisionDropdownState();
// }

// class DivisionDropdownState extends State<DivisionDropdown> {
//   String? selectedDivision;
//   String? selectedDistrict;
//   late List<Division> divisions;
//   late List<District> districts;

//   @override
//   void initState() {
//     super.initState();
//     // Parse JSON data into Division objects
//     divisions = divisionsData.map((data) => Division.fromJson(data)).toList();
//     districts = [];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Division Dropdown
//         Text(
//           widget.useBangla ? "বিভাগ নির্বাচন করুন" : "Select Division",
//         ),
//         DropdownButton<String>(
//           hint: Text(
//             widget.useBangla ? "বিভাগ নির্বাচন করুন" : "Select Division",
//           ),
//           value: selectedDivision,
//           onChanged: (newValue) {
//             setState(() {
//               selectedDivision = newValue;
//               selectedDistrict = null; // Reset district when division changes
//               // Find the selected division and update the districts list
//               Division? selectedDivisionObj = divisions.firstWhere(
//                 (division) => division.id == newValue,
//                 orElse: () => Division(
//                   divisionId: '',
//                   divisionName: '',
//                   districts: [],
//                 ),
//               );
//               districts = selectedDivisionObj.districts;
//             });
//           },
//           items: divisions.map((division) {
//             return DropdownMenuItem<String>(
//               value: division.id,
//               child: Text(
//                 widget.useBangla ? division.bnName : division.name,
//               ),
//             );
//           }).toList(),
//         ),

//         // District Dropdown
//         if (districts.isNotEmpty)
//           Text(
//             widget.useBangla ? "জেলা নির্বাচন করুন" : "Select District",
//           ),
//         if (districts.isNotEmpty)
//           DropdownButton<String>(
//             hint: Text(
//               widget.useBangla ? "জেলা নির্বাচন করুন" : "Select District",
//             ),
//             value: selectedDistrict,
//             onChanged: (newValue) {
//               setState(() {
//                 selectedDistrict = newValue;
//               });
//             },
//             items: districts.map((district) {
//               return DropdownMenuItem<String>(
//                 value: district.id,
//                 child: Text(
//                   widget.useBangla ? district.bnName : district.name,
//                 ),
//               );
//             }).toList(),
//           ),
//       ],
//     );
//   }
// }
