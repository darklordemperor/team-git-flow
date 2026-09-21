import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//aasda;sfdka;gsdlfsldfsmldk
// test flow git
void main() {
  runApp(const ProviderScope(child: MainApp()));
}

//
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: ExcludeSemantics(child: FlutterLogo(size: 120))),
      ),
    );
  }
}
