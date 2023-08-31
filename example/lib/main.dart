import 'package:flutter/material.dart';
import 'package:nine_scaling_image/nine_scaling_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Example ',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Plugin Example'),
        ),
        body: Center(
            child: Container(
              width: 200,
          height: 200,
          color: Colors.orangeAccent,
          child: const NineScalingImage(assetPath: 'assets/sampleimage.png'),
        )));
  }
}
