import 'package:healtypetapp/models/services_model.dart';

class DoctorModel {
  late String images;
  late String name;
  late List<String> services;
  late int distance;

  DoctorModel({
    required this.images,
    required this.name,
    required this.services,
    required this.distance,
  });
}

var doctors = [
  DoctorModel(
      images: 'dr_stone.jpg',
      name: 'Dr. Stone',
      services: [Services.vaccine, Services.surgery],
      distance: 10),
  DoctorModel(
      images: 'dr_vanessa.jpg',
      name: 'Dr. Vanessa',
      services: [Services.vaccine, Services.consultation],
      distance: 130),
  DoctorModel(
      images: 'dr_stone.jpg',
      name: 'Dr. Stone',
      services: [
        Services.vaccine,
        Services.consultation,
      ],
      distance: 7)
];
