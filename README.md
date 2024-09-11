
# Flutter Typing Indicator

A customizable typing indicator widget for Flutter applications, perfect for simulating a "typing..." effect with animated dots. The widget offers full customization options for color, size, shape, shadow, gradients, and more.

# Demo
### Quick Demo

![ScreenRecording2024-09-10at11 26 42PM-ezgif com-video-to-gif-converter](https://github.com/user-attachments/assets/f64b5683-e257-481d-a7b6-e7d243f5d8f7)


### Full Demo

You can watch the full demo video by following this [link](https://github.com/user-attachments/assets/4c1307f0-2c0f-4c1d-8a13-12538b88a694) or view it directly below:

<video width="600" controls>
  <source src="https://github.com/user-attachments/assets/4c1307f0-2c0f-4c1d-8a13-12538b88a694" type="video/mp4">
  Your browser does not support the video tag.
</video>



## Features

- Customize dot colors, shapes, gradients, borders, shadows, and more.
- Use images instead of solid colors for the dots.
- Flexible control over the number of dots and their animation duration.
- Ideal for chat applications or any situation where you need a "typing..." animation.
  
## Installation

Add this widget directly to your Flutter project:

1. Add the following dependency to your `pubspec.yaml` file:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
   ```

2. Import the `TypingIndicator` widget in your Dart file:

   ```dart
    import 'package:flutter_typing_indicator/flutter_typing_indicator.dart';
    ```

## Usage

Here's a basic example of how to use the `TypingIndicator`:

```dart
import 'package:flutter/material.dart';
import 'typing_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Typing Indicator Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Center(
          child: TypingIndicator(
            dotColor: Colors.blue,
            backgroundColor: Colors.white,
            dotSize: 10.0,
            dotCount: 4,
            duration: Duration(milliseconds: 1500),
            padding: 12.0,
            dotShape: BoxShape.circle,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            dotShadow: [BoxShadow(blurRadius: 2, color: Colors.black)],
            isGradient: true,
            dotGradient: LinearGradient(
              colors: [Colors.blue, Colors.lightBlueAccent],
            ),
            isDotImage: true,
            dotImage: DecorationImage(
              image: AssetImage('assets/images/typing_indicator.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
```

## Customization Options

### Constructor Parameters

| Property          | Type                       | Default Value                                 | Description                                                                 |
|-------------------|----------------------------|-----------------------------------------------|-----------------------------------------------------------------------------|
| `dotColor`        | `Color`                    | `Colors.grey`                                 | Color of the dots in the indicator.                                         |
| `backgroundColor` | `Color`                    | `Color(0xFFE0E0E0)`                           | Background color of the indicator box.                                      |
| `dotSize`         | `double`                   | `8.0`                                         | Size of each dot.                                                           |
| `dotCount`        | `int`                      | `3`                                           | Number of dots to display.                                                  |
| `duration`        | `Duration`                 | `Duration(milliseconds: 1000)`                | Animation duration for a full cycle.                                        |
| `padding`         | `double`                   | `8.0`                                         | Padding inside the indicator container.                                     |
| `borderRadius`    | `BorderRadiusGeometry`      | `BorderRadius.all(Radius.circular(12.0))`     | Border radius of the container.                                             |
| `dotShape`        | `BoxShape`                 | `BoxShape.circle`                             | Shape of each dot, e.g., `BoxShape.circle` or `BoxShape.rectangle`.         |
| `dotShadow`       | `List<BoxShadow>`           | `[]`                                          | List of box shadows for the dots.                                           |
| `dotBorder`       | `BoxBorder`                | `Border()`                                    | Border for the dots.                                                        |
| `dotGradient`     | `Gradient`                 | `LinearGradient(colors: [Colors.grey, Colors.grey])` | Gradient for the dots (if enabled).                                         |
| `isGradient`      | `bool`                     | `false`                                       | Set to `true` if you want to use gradients instead of solid colors.         |
| `dotImage`        | `DecorationImage`          | `DecorationImage(image: AssetImage('assets/images/typing_indicator.png'), fit: BoxFit.cover)` | Image for the dots (if enabled).                                            |
| `isDotImage`      | `bool`                     | `false`                                       | Set to `true` if you want to use an image for the dots.                     |
| `curve`           | `Curve`                    | `Curves.easeInOut`                            | Animation curve for the dot animations.                                     |

## License

This widget is licensed under the MIT License. Feel free to use and modify it in your own projects.
