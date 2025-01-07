import 'package:bd_address_two/data/bd_districts.dart';
import 'package:bd_address_two/data/bd_upazila.dart';
import 'package:bd_address_two/data/divisions_data.dart';
import 'package:bd_address_two/models/districts_model.dart';
import 'package:bd_address_two/models/division.dart';
import 'package:bd_address_two/models/upazila_model.dart';
import 'package:flutter/material.dart';


class DivisionDropdown extends StatefulWidget {
  final bool useBangla;

  const DivisionDropdown({super.key, this.useBangla = false});

  @override
  DivisionDropdownState createState() => DivisionDropdownState();
}

class DivisionDropdownState extends State<DivisionDropdown> {
  String? selectedDivision;
  String? selectedDistrict;
  String? selectedUpazila;

  late List<Division> divisions;
  List<District> districts = [];
  List<Upazila> upazilas = [];

  @override
  void initState() {
    super.initState();
    divisions = divisionsData.map((data) => Division.fromJson(data)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Division Dropdown
        Text(
          widget.useBangla ? "বিভাগ নির্বাচন করুন" : "Select Division",
          style: const TextStyle(fontSize: 16),
        ),
        DropdownButton<String>(
          hint: Text(
            widget.useBangla ? "বিভাগ নির্বাচন করুন" : "Select Division",
          ),
          value: selectedDivision,
          onChanged: (newValue) {
            setState(() {
              selectedDivision = newValue;
              selectedDistrict = null; // Reset district
              selectedUpazila = null; // Reset upazila
              districts = districtData.firstWhere(
                (data) => data['division_id'] == newValue,
                orElse: () => {'districts': []},
              )['districts']
                  .map<District>((d) => District.fromJson(d))
                  .toList();
              upazilas = [];
              debugPrint("Selected Division: $selectedDivision");
            });
          },
          items: divisions.map((division) {
            return DropdownMenuItem<String>(
              value: division.id,
              child: Text(
                widget.useBangla ? division.bnName : division.name,
              ),
            );
          }).toList(),
        ),

        // District Dropdown
        if (districts.isNotEmpty) ...[
          const SizedBox(height: 16),
          Text(
            widget.useBangla ? "জেলা নির্বাচন করুন" : "Select District",
            style: const TextStyle(fontSize: 16),
          ),
          DropdownButton<String>(
            hint: Text(
              widget.useBangla ? "জেলা নির্বাচন করুন" : "Select District",
            ),
            value: selectedDistrict,
            onChanged: (newValue) {
              setState(() {
                selectedDistrict = newValue;
                selectedUpazila = null; // Reset upazila

                final districtData = upazilaData.firstWhere(
                  (data) => data['districts'][newValue] != null,
                  orElse: () => {'districts': {}},
                );

                if (districtData['districts'][newValue] != null) {
                  upazilas =
                      (districtData['districts'][newValue]['upazilas'] as List)
                          .map<Upazila>((u) => Upazila(
                                id: u['id'],
                                districtId: newValue!,
                                name: u['name'],
                                bnName: u['bn_name'],
                              ))
                          .toList();
                } else {
                  upazilas = [];
                }
                debugPrint("Selected District: $selectedDistrict");
              });
            },
            items: districts.map((district) {
              return DropdownMenuItem<String>(
                value: district.id,
                child: Text(
                  widget.useBangla ? district.bnName : district.name,
                ),
              );
            }).toList(),
          ),
        ],

        // Upazila Dropdown
        if (upazilas.isNotEmpty) ...[
          const SizedBox(height: 16),
          Text(
            widget.useBangla ? "উপজেলা নির্বাচন করুন" : "Select Upazila",
            style: const TextStyle(fontSize: 16),
          ),
          DropdownButton<String>(
            hint: Text(
              widget.useBangla ? "উপজেলা নির্বাচন করুন" : "Select Upazila",
            ),
            value: selectedUpazila,
            onChanged: (newValue) {
              setState(() {
                selectedUpazila = newValue;
                debugPrint("Selected Upazila: $selectedUpazila");
              });
            },
            items: upazilas.map((upazila) {
              return DropdownMenuItem<String>(
                value: upazila.id,
                child: Text(
                  widget.useBangla ? upazila.bnName : upazila.name,
                ),
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}



