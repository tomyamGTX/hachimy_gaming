import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hachimy_gaming/const/const_string.dart';
import 'package:hachimy_gaming/vn_lib/landing.dart';
import 'package:hachimy_gaming/vn_lib/message_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MessageProvider())
      ],
      child: MaterialApp(
        title: appName,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          useMaterial3: true,
        ),
        home: const Landing(),
      ),
    );
  }
}
