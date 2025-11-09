import 'package:flutter_application_5/domain/entities/organic.dart';

abstract class OrganicRepository {
  Future<List<Organic>> getAllOrganic();
}
