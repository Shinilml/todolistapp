// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:todolistappexm/view/homescreen/homescreen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
// // void main() {
// //   runApp(MyApp());
// // }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Homescreen(),
//     );
//   }
// }
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todolistappexm/firebase_options.dart';
import 'package:todolistappexm/view/homescreen/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // Use the appropriate FirebaseOptions for the platform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homescreen(),
    );
  }
}
