import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:via_cep_mobile/src/app_module.dart';

void main() {
  return runApp(ModularApp(module: AppModule(), child: const App()));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ViaCep Mobile',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
