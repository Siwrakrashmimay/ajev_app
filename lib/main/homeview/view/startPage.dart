// ignore: file_names
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool isLocked = true;
  bool isStart = false;
  bool isfind = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.88,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/Asset 21@4x.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'ENG|TH',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'BEATS',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      const SizedBox(width: 210),
                      Image.asset(
                        'assets/image/Asset logo@4x.png',
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          !isStart
                              ? Image.asset(
                                  'assets/image/Asset 4@4x.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.32,
                                  height:
                                      MediaQuery.of(context).size.width * 0.32,
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.blue.withOpacity(0.3),
                                          spreadRadius: 3,
                                          blurRadius: 40)
                                    ],
                                  ),
                                  child: Image.asset(
                                    'assets/image/Asset 4@4x.png',
                                    width: MediaQuery.of(context).size.width *
                                        0.32,
                                    height: MediaQuery.of(context).size.width *
                                        0.32,
                                  ),
                                ),
                          const SizedBox(height: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '100%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.10,
                                ),
                              ),
                              const SizedBox(height: 1),
                              Text(
                                '999 KM.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/image/BEAT.png',
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.width * 0.6,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isStart = !isStart;
                          });
                        },
                        child: isStart
                            ? Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue.withOpacity(0.6),
                                        spreadRadius: 10,
                                        blurRadius: 20)
                                  ],
                                ),
                                child: Image.asset(
                                  'assets/image/Asset 5@4x.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height:
                                      MediaQuery.of(context).size.width * 0.5,
                                ),
                              )
                            : Image.asset(
                                'assets/image/Asset 5@4x.png',
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: MediaQuery.of(context).size.width * 0.5,
                              ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isLocked = !isLocked;
                              });
                            },
                            child: isLocked
                                ? Image.asset(
                                    'assets/image/Asset 6@4x.png',
                                    width: MediaQuery.of(context).size.width *
                                        0.22,
                                    height: MediaQuery.of(context).size.width *
                                        0.22,
                                  )
                                : Image.asset(
                                    'assets/image/Asset 7@4x.png',
                                    width: MediaQuery.of(context).size.width *
                                        0.22,
                                    height: MediaQuery.of(context).size.width *
                                        0.22,
                                  ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isfind = !isfind;
                              });
                            },
                            child: isfind
                                ? Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.blue.withOpacity(0.6),
                                            spreadRadius: 3,
                                            blurRadius: 20)
                                      ],
                                    ),
                                    child: Image.asset(
                                      'assets/image/Asset 8@4x.png',
                                      width: MediaQuery.of(context).size.width *
                                          0.22,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.22,
                                    ),
                                  )
                                : Image.asset(
                                    'assets/image/Asset 8@4x.png',
                                    width: MediaQuery.of(context).size.width *
                                        0.22,
                                    height: MediaQuery.of(context).size.width *
                                        0.22,
                                  ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
