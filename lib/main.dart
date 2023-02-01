import 'package:flutter/material.dart';
import 'package:star_book/presentation/injector/injector.dart';
import 'package:star_book/theme/ultramarine_light.dart';
import 'package:star_book/widgets/gradient_scaffold.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.initialise();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: UltramarineLightTheme().theme,
      home: const GradientScaffold(body: SizedBox()),
    );
  }
}
