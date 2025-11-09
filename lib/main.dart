import 'package:flutter_application_5/data/repositories/organic_repository_impl.dart';
import 'package:flutter_application_5/domain/usecases/get_organics_usecase.dart';
import 'package:flutter_application_5/presentation/Organic/state/organic_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/Organic/pages/organic_list_page.dart';
import 'package:http/http.dart' as http;

void main() {
  final organicRepository = OrganicRepositoryImpl(client: http.Client());
  final getOrganicUseCase = GetOrganicsUseCase(organicRepository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:
              (_) =>
                  OrganicProvider(getOrganicsUseCase: getOrganicUseCase)
                    ..fetchOrganics(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'App', home: OrganicListPage());
  }
}
