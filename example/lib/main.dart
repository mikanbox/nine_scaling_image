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
        body: Padding(
          padding: const EdgeInsets.all(10),
            child: Row(
                children: [
                  Column(
                    children: [
                      const Text("Source Image \n 4x Scaled"),
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset('assets/sampleimage.png',fit: BoxFit.contain,
                              isAntiAlias: false,
                              filterQuality: FilterQuality.none,),
                            const Align(
                              alignment: Alignment(-0.8, -0.8),
                              child: Text("piece 4x4", style: TextStyle(color: Colors.red),),
                            ),
                            Align(
                              alignment: const Alignment(-1.0, -1.0),
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(1.0, -1.0),
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(1.0, 1.0),
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(-1.0, 1.0),
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red),
                                ),
                              ),
                            ),
                          ],
                        )

                      )
                    ],
                  ),
                  const Column(
                    children: [
                      Text("Nine Scaling Image \n (dstPieceScale: 1)"),
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: NineScalingImage(assetPath: 'assets/sampleimage.png', pieceSize: Size.square(5),)
                      )
                    ],
                  ),
                  const Column(
                    children: [
                      Text("Nine Scaling Image \n (dstPieceScale: 4)"),
                      SizedBox(
                          width: 120,
                          height: 120,
                          child: NineScalingImage(assetPath: 'assets/sampleimage.png',
                            pieceSize: Size.square(5), dstPieceScale: 4,)
                      )
                    ],
                  ),
                  const Column(
                    children: [
                      Text("Nine Scaling Image \n (dstPieceScale: 8)"),
                      SizedBox(
                          width: 120,
                          height: 120,
                          child: NineScalingImage(assetPath: 'assets/sampleimage.png',
                            pieceSize: Size.square(5), dstPieceScale: 8,)
                      )
                    ],
                  ),
                  const Column(
                    children: [
                      Text("Nine Scaling Image \n with child text wiedget"),
                      SizedBox(
                          width: 120,
                          height: 120,
                          child: NineScalingImage(assetPath: 'assets/sampleimage.png',
                            pieceSize: Size.square(5), child: Text("child text"),)
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Nine Scaling Image \n with child Container wiedget"),
                      SizedBox(
                          width: 120,
                          height: 120,
                          child: NineScalingImage(assetPath: 'assets/sampleimage.png',
                            pieceSize: Size.square(5), child: Container(
                              color: Colors.red,
                            ),)
                      )
                    ],
                  ),
                  const Column(
                    children: [
                      Text("Nine Scaling Image \n with centerColor"),
                      SizedBox(
                          width: 120,
                          height: 120,
                          child: NineScalingImage(assetPath: 'assets/sampleimage.png',
                            pieceSize: Size.square(5),
                              centerColor: Colors.red,
                          )
                      )
                    ],
                  )

                ]
            )






        )
    );
  }
}
