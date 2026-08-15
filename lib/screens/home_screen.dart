import 'package:flutter/material.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/images_row_widget.dart';
import '../widgets/display_text_widget.dart';

/// Demo screen showing Phase 2 widgets (images and text)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'My First Project'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display two images with gap
            ImagesRowWidget(
              assetImagePath: 'assets/images/1.jpg',
              networkImageUrl:
                  'https://cdn-icons-png.flaticon.com/512/8750/8750935.png',
              imageWidth: 100,
              imageHeight: 100,
              gap: 20,
            ),
            const SizedBox(height: 30),
            // Display customized text
            const DisplayTextWidget(
              text: 'The two images are displayed',
              fontSize: 18,
              fontFamily: 'Suwannaphum',
              textColor: Colors.deepPurple,
              isBold: true,
            ),
            const SizedBox(height: 40),
            // Button to navigate to Sign Up
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/signup');
              },
              child: const Text('Go to Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
