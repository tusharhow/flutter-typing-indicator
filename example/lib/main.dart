import 'package:flutter/material.dart';
import 'package:flutter_typing_indicator/flutter_typing_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: TypingIndicator(
              dotSize: 20,
              isGradient: true,
              backgroundColor: Colors.orange.shade100,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(12),
              ),
              dotGradient: const LinearGradient(
                colors: [
                  Color(0xFFF12711),
                  Color(0xFFF5AF19),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: TypingIndicator(
              dotSize: 20,
              isGradient: true,
              backgroundColor: Colors.green.shade100,
              dotGradient: const LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.indigo,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: TypingIndicator(
              dotSize: 20,
              isGradient: true,
              backgroundColor: Colors.indigo.shade100,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(0),
              ),
              dotGradient: const LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.indigo,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: TypingIndicator(
              dotSize: 20,
              isGradient: false,
            ),
          ),
        ],
      ),
    );
  }
}
