import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hachimy_gaming/coming_soon/coming_soon.dart';
import 'package:hachimy_gaming/dance_lib/dance.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return !kIsWeb
        ? const ComingSoon()
        : Scaffold(
            backgroundColor: const Color(0xffffffff),
            body: Center(
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/9452052.jpg'),
                        fit: BoxFit.fill)),
                height: size.height,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(200, 50),
                          backgroundColor: Colors.primaries[0].shade50),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GenshinDance()));
                      },
                      icon: const Icon(Icons.video_library_sharp),
                      label: const Text("Genshin Dance"),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(200, 50),
                          backgroundColor: Colors.primaries[1].shade50),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ComingSoon()));
                      },
                      icon: const Icon(Icons.account_circle),
                      label: const Text("Genshin Account"),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 50),
                        backgroundColor: Colors.primaries[2].shade50,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ComingSoon()));
                      },
                      icon: const Icon(Icons.class_),
                      label: const Text("Flutter Web Class"),
                    ),
                  ],
                ),
              ),
            ));
  }
}
