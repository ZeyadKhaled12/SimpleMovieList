import 'package:flutter/material.dart';
import 'package:movies_app/movies/presentation/screens/movies_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: TextButton(
            child: const Text('Navigate', style: TextStyle(fontSize: 26)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MoviesScreen()));
        },
      ),
    ));
  }
}
