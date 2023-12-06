import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonWidget {
  static Widget myButton(String text, color, link) {
    return ElevatedButton(
      onPressed: () {
        launchUrl(Uri.parse(link));
      },
      style: ElevatedButton.styleFrom(backgroundColor: color),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
