import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class GenshinDance extends StatefulWidget {
  const GenshinDance({super.key});

  @override
  State<GenshinDance> createState() => _GenshinDanceState();
}

class _GenshinDanceState extends State<GenshinDance> {
  late VideoPlayerController _controller;
  late VideoPlayerController _controller2;
  final _pageController = PageController();
  var index = 1;
  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/hachimygaming.appspot.com/o/Kawaiikute.mp4?alt=media&token=87c43b2c-ba86-4c13-9dbb-ff016ead5c72'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller2 = VideoPlayerController.networkUrl(Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/hachimygaming.appspot.com/o/bumbble.mp4?alt=media&token=89548093-8107-46a9-8161-c5cd6ca112c8'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<VideoPlayerController> list = [_controller, _controller2];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Genshin Dance"),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return !list[index].value.isInitialized
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Text(
                      "Enjoy the dance :)",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .apply(fontWeightDelta: 2, letterSpacingDelta: 2),
                    ),
                    const SizedBox(height: 32),
                    Flexible(child: VideoPlayer(list[index])),
                    const Spacer(),
                  ],
                );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (v) {
          setState(() {
            index = v;
          });
          if (v == 1) {
            if (_pageController.page == 0) {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            } else if (_pageController.page == 1) {
              setState(() {
                _controller2.value.isPlaying
                    ? _controller2.pause()
                    : _controller2.play();
              });
            }
          } else if (v == 2) {
            _pageController.animateToPage(1,
                duration: const Duration(seconds: 1), curve: Curves.easeIn);
          } else {
            _pageController.animateToPage(0,
                duration: const Duration(seconds: 1), curve: Curves.easeIn);
          }
        },
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.navigate_before), label: 'Previous'),
          BottomNavigationBarItem(
              icon: _controller.value.isPlaying || _controller2.value.isPlaying
                  ? const Icon(Icons.pause)
                  : const Icon(Icons.play_arrow),
              label: _controller.value.isPlaying || _controller2.value.isPlaying
                  ? "Pause"
                  : 'Play'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.navigate_next), label: 'Next')
        ],
      ),
    );
  }
}
