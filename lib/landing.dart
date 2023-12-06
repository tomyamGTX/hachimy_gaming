import 'package:flutter/material.dart';
import 'package:hachimy_gaming/home/home.dart';
import 'package:hachimy_gaming/widgets/button.dart';
import 'package:typewritertext/typewritertext.dart';

import 'const/const_string.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
            label: const Text("Explore"),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              TypeWriterText(
                text: Text(
                  'Welcome to $appName',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .apply(fontWeightDelta: 2),
                  textAlign: TextAlign.center,
                ),
                duration: const Duration(milliseconds: 150),
              ),
              const SizedBox(height: 16),
              ButtonWidget.myButton(
                  "Become SUS Army", Colors.amber, subscribeUrl),
              const SizedBox(height: 8),
              ButtonWidget.myButton(
                  "Join Discord", const Color(0xff7289da), discordUrl),
              const SizedBox(height: 8),
              ButtonWidget.myButton("Follow Tiktok", Colors.black, tiktokUrl),
              Flexible(child: Image.asset('assets/5272450.jpg'))
            ],
          ),
        ));
  }
}
