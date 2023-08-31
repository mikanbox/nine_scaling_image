<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

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
NineScalingImage img = NineScalingImage(assetPath: 'assets/sampleimage.png',pieceSize: 10,);
```

You can set following 2 parameters:
- assetPath (required)
  - a path to image
- centerColor (not required)
  - a color which fill the center of widget



