import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stripe_animation/model/speakers.dart';
import 'package:stripe_animation/widgets/myAppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  List<Speakers> speaker = speakers;
  int selected = 4;
  double containerSize = 80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const MyAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ActionChip(
                    backgroundColor: Colors.lightBlue.shade100,
                    pressElevation: .5,
                    onPressed: (){
                      _scrollController.animateTo(
                        _scrollController.position.minScrollExtent,
                        duration: const Duration(seconds: 2), 
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                    shape: const CircleBorder(),
                    label: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  ActionChip(
                    backgroundColor: Colors.lightBlue.shade100,
                    pressElevation: .5,
                    onPressed: (){
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: const Duration(seconds: 2), 
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                    shape: const CircleBorder(),
                    label: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: double.infinity,
                width: double.infinity,
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: speaker.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          selected = index;
                        });
                      },
                      child: Stack(
                        children:[ 
                          AnimatedContainer(
                            duration: const Duration(seconds: 2),
                            margin: const EdgeInsets.only(right: 20),
                            curve: Curves.fastLinearToSlowEaseIn,
                            height: double.infinity,
                            width: selected == index ? containerSize = 470 : 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(speaker[index].image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(seconds: 2),
                            margin: const EdgeInsets.only(right: 20),
                            curve: Curves.fastLinearToSlowEaseIn,
                            height: double.infinity,
                            width: selected == index ? containerSize = 470 : 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.center,
                                colors: [
                                  Colors.black,
                                  Colors.black.withOpacity(.7),
                                  Colors.black.withOpacity(.2),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 55,
                            left: 20,
                            child: Text(
                              selected != index ? "" : speaker[index].jobTitle,
                              style: GoogleFonts.outfit(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: Text(
                              selected != index ? "" : speaker[index].name,
                              style: GoogleFonts.outfit(
                                color: Colors.white,
                                fontSize: 25
                              ),
                            ),
                          )
                        ]
                      )
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}