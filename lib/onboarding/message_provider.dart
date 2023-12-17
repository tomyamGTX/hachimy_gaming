import 'package:flutter/material.dart';

class MessageProvider extends ChangeNotifier {
  List<String> messageText = ['Welcome to my website. Do you need anything?'];

  get isRepeat => true;

  Future<List<String>>? currentMessage() async {
    return messageText;
  }

  void update(data) {
    messageText = data;
    notifyListeners();
  }
}
