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
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.orangeAccent,
                child: const NineScalingImage(assetPath: 'assets/sampleimage.png', pieceSize: Size.square(5),),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.orangeAccent,
                child: NineScalingImage(assetPath: 'assets/sampleimage.png', pieceSize: const Size.square(5),
                child: Container(color: Colors.red,width: 30,height: 30,),
                  ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.orangeAccent,
                child: NineScalingImage(assetPath: 'assets/sampleimage.png', pieceSize: const Size.square(5),
                  child: Container(color: Colors.red,width: 30,height: 30,),
                  dstPieceScale: 4.0,
                ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.orangeAccent,
                child: NineScalingImage(assetPath: 'assets/sampleimage.png', pieceSize: const Size.square(5),

                  dstPieceScale: 4.0,
                ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.orangeAccent,
                child: NineScalingImage(assetPath: 'assets/sampleimage.png', pieceSize: const Size.square(5),
                  child: Image.asset('assets/sampleimage.png'),
                  dstPieceScale: 4.0,
                ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.orangeAccent,
                child: NineScalingImage(assetPath: 'assets/sampleimage.png', pieceSize: const Size.square(5),
                  child: Text("frame"),
                  dstPieceScale: 4.0,
                ),
              ),
          ],
        )
        )
    );
  }
}
