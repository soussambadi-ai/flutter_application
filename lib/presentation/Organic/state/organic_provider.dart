import 'package:flutter_application_5/domain/entities/organic.dart';
import 'package:flutter_application_5/domain/usecases/get_organics_usecase.dart';
import 'package:flutter/material.dart';

class OrganicProvider with ChangeNotifier {
  final GetOrganicsUseCase getOrganicsUseCase;

  OrganicProvider({required this.getOrganicsUseCase});

  List<Organic> _organic = [];
  List<Organic> get organic => _organic;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _error = '';
  String get error => _error;

  Future<void> fetchOrganics() async {
    _isLoading = true;
    _error = '';
    notifyListeners();
    try {
      _organic = await getOrganicsUseCase.execute();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
