import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/homepage.dart';
import 'package:provider_example/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => MovieProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
