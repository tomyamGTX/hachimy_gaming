import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hachimy_gaming/const/const_string.dart';
import 'package:hachimy_gaming/home/home.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'message_provider.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  var choice = ['Join Discord', 'Become $supporterName'];

  var repeatCounter = 1;

  var _display = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var mp = Provider.of<MessageProvider>(context);
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
            label: const Text("Skip"),
          ),
        ),
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)),
            height: size.height,
            width: 400,
            child: Column(
              children: [
                const Spacer(),
                if (_display)
                  for (var item in choice)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: RawChip(
                        backgroundColor: Colors.amber.shade200,
                        label: Text(item),
                        onPressed: () async {
                          if (item == 'Join Discord') {
                            mp.update([
                              'You can click or copy this link and paste it at your browser'
                            ]);
                            choice.clear();
                            choice.addAll(
                                ['copy-link', 'open-link', 'Back to Home']);
                            setState(() {
                              _display = false;
                            });
                          } else if (item == 'copy-link') {
                            mp.update(['link copied']);
                            await Clipboard.setData(
                                const ClipboardData(text: discordUrl));
                            choice.clear();
                            choice.addAll(['Done']);
                          } else if (item == 'open-link') {
                            launchUrl(Uri.parse(discordUrl));
                            mp.update(['navigating discord ...']);
                            choice.clear();
                            choice.addAll(['Done']);
                          } else if (item == 'Done') {
                            mp.update([
                              'Thanks for joining.. Feel free to explore more XD'
                            ]);
                            choice.clear();
                            choice.addAll(['Back to Home']);
                            setState(() {
                              _display = false;
                            });
                          } else if (item == 'Watch my Tiktok Live') {
                            mp.update(['Navigating to Tiktok...']);
                            launchUrl(Uri.parse(tiktokUrl));
                            choice.clear();
                            choice.addAll(['Back to Home']);
                            setState(() {
                              _display = false;
                            });
                          } else if (item == 'Back to Home') {
                            mp.update([
                              'Welcome to my website. Do you need anything?'
                            ]);
                            choice.clear();
                            choice.addAll(
                                ['Join Discord', 'Become $supporterName']);
                            setState(() {
                              _display = false;
                            });
                          } else {
                            mp.update([
                              'Join $supporterName during my live and enjoy many benefits...'
                            ]);
                            choice.clear();
                            choice.addAll(
                                ['Watch my Tiktok Live', 'Back to Home']);
                            setState(() {
                              _display = false;
                            });
                          }
                        },
                      ),
                    ),
                SizedBox(height: size.height * 0.2),
                Container(
                  height: size.height * 0.4,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset(
                            charImagePath,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                          ),
                          width: size.width,
                          child: Center(
                            child: Column(
                              children: [
                                const SizedBox(height: 8),
                                const Text(charName,
                                    style: TextStyle(
                                        fontFamily: 'Agne',
                                        color: Colors.white)),
                                const Divider(),
                                DefaultTextStyle(
                                  style: const TextStyle(
                                      fontFamily: 'Agne', color: Colors.white),
                                  child: FutureBuilder<List<String>>(
                                    builder: (
                                      context,
                                      message,
                                    ) {
                                      print(message.data);
                                      return message.data != null
                                          ? AnimatedTextKit(
                                              onNext: (i, value) {
                                                setState(() {
                                                  _display = value;
                                                });
                                              },
                                              animatedTexts: message.data!
                                                  .map((e) =>
                                                      TypewriterAnimatedText(e))
                                                  .toList(),
                                              stopPauseOnTap: true,
                                              totalRepeatCount: 1,
                                              repeatForever: mp.isRepeat,
                                              onTap: () {
                                                print(message.data);
                                              },
                                            )
                                          : const SizedBox.shrink();
                                    },
                                    future: mp.currentMessage(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
