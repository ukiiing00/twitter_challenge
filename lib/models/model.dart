import 'dart:math';

import 'package:faker/faker.dart';

class Model {
  String image = Faker().image.image(random: true);
  String title = Faker().person.name();
  String subtitle = Faker().job.title();
  String company = Faker().company.name();
  String position = Faker().company.position();
  int count = Random().nextInt(1000);
  bool follow = false;

  Model();
}
