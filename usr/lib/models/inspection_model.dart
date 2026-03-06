import 'package:flutter/material.dart';

enum InspectionStatus { good, fair, poor, notApplicable }

class InspectionItem {
  final String name;
  final InspectionStatus status;
  final String? comment;

  InspectionItem({
    required this.name,
    required this.status,
    this.comment,
  });
}

class WaterHeaterSpecs {
  final String brand;
  final String modelNumber;
  final String serialNumber;
  final int ageYears;
  final double capacityGallons;
  final String location;
  final String fuelType; // Gas, Electric, Hybrid, etc.

  WaterHeaterSpecs({
    required this.brand,
    required this.modelNumber,
    required this.serialNumber,
    required this.ageYears,
    required this.capacityGallons,
    required this.location,
    required this.fuelType,
  });
}

class InspectionReport {
  final String id;
  final DateTime date;
  final String address;
  final String homeownerName;
  final String inspectorName;
  final WaterHeaterSpecs specs;
  final List<InspectionItem> checklist;
  final String overallSummary;
  final String recommendations;
  final InspectionStatus overallCondition;

  InspectionReport({
    required this.id,
    required this.date,
    required this.address,
    required this.homeownerName,
    required this.inspectorName,
    required this.specs,
    required this.checklist,
    required this.overallSummary,
    required this.recommendations,
    required this.overallCondition,
  });

  // Mock data factory
  factory InspectionReport.mock() {
    return InspectionReport(
      id: 'WH-2024-001',
      date: DateTime.now(),
      address: '123 Maple Avenue, Springfield, IL',
      homeownerName: 'John & Jane Doe',
      inspectorName: 'Mike Holmes',
      overallCondition: InspectionStatus.fair,
      overallSummary: 'The water heater is functional but showing signs of age. Maintenance is recommended to extend its lifespan.',
      recommendations: '1. Flush the tank to remove sediment buildup.\n2. Replace the sacrificial anode rod within the next 6 months.\n3. Monitor the slight corrosion on the cold water inlet.',
      specs: WaterHeaterSpecs(
        brand: 'Bradford White',
        modelNumber: 'RG250T6N',
        serialNumber: 'JH12345678',
        ageYears: 8,
        capacityGallons: 50.0,
        location: 'Basement Utility Room',
        fuelType: 'Natural Gas',
      ),
      checklist: [
        InspectionItem(name: 'T&P Relief Valve', status: InspectionStatus.good, comment: 'Operates correctly, no leaks detected.'),
        InspectionItem(name: 'Venting System', status: InspectionStatus.good, comment: 'Draft is good, no obstructions.'),
        InspectionItem(name: 'Burner Assembly', status: InspectionStatus.fair, comment: 'Flame is mostly blue but has some yellow tips. Cleaning recommended.'),
        InspectionItem(name: 'Water Piping', status: InspectionStatus.fair, comment: 'Minor surface corrosion on cold water inlet nipple.'),
        InspectionItem(name: 'Gas Line & Valve', status: InspectionStatus.good),
        InspectionItem(name: 'Tank Condition', status: InspectionStatus.good, comment: 'No external leaks observed.'),
        InspectionItem(name: 'Expansion Tank', status: InspectionStatus.notApplicable, comment: 'Not present (not required by local code at time of install).'),
        InspectionItem(name: 'Combustion Air', status: InspectionStatus.good),
      ],
    );
  }
}
