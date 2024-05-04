# Nine Scaling Image
This package allows user use nine-scaling image widget on Flutter.
This is useful especially for application with pixel-art design. 

## Getting Started
Add `nine_scaling_image` to your pubspec.yaml:
```yaml
nine_scaling_image: any
```

## Adding Widget on your project
Add your material image file into your project and update `pubspec.yaml` to use it like as follows:
```yaml
flutter:
  assets:
    - assets/sampleimage.png
```

Import package and use NineScalingImage class as folows:
```dart
NineScalingImage img = NineScalingImage(assetPath: 'assets/sampleimage.png', pieceSize: const Size.square(5));
```

You can set following parameters:
- assetPath (required)
  - a path to image
- pieceSize (required)
  - a piece size in nine-scaling
- centerColor (optional)
  - a color which fill the center of widget
- dstPieceScale (optional)
  - a piece ratio between scource image and destination widget size
- child (optional)
  - child widget in nine-scaling object


