import 'package:flutter/material.dart';

import '../../widget/Info.dart';

class BikeViewPage extends StatelessWidget {
  const BikeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height *
                0.95, // Set container height to screen height
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/Asset 21@4x.png'),
                fit:
                    BoxFit.fill, // Ensure the image covers the entire container
              ),
            ),
            child: Stack(
              children: [
                Center(
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
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Image.asset(
                                'assets/image/Asset 4@4x.png',
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:
                                    MediaQuery.of(context).size.width * 0.25,
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
                                          MediaQuery.of(context).size.width *
                                              0.08,
                                    ),
                                  ),
                                  const SizedBox(height: 1),
                                  Text(
                                    '999 KM.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1),
                          Image.asset(
                            'assets/image/BEAT.png',
                            width: MediaQuery.of(context).size.width * 0.55,
                            height: MediaQuery.of(context).size.width * 0.55,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Container(
                      //       decoration: BoxDecoration(
                      //         border: Border.all(color: Colors.white, width: 3),
                      //         borderRadius: BorderRadius.circular(10),
                      //       ),
                      //       margin: const EdgeInsets.symmetric(horizontal: 10),
                      //       padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      //       width: MediaQuery.of(context).size.width *
                      //           0.9, // Adjusted width
                      //       child: const Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text(
                      //                 'รอบชาร์จแบตเตอรรี่',
                      //                 style: TextStyle(
                      //                     color: Colors.white, fontSize: 16),
                      //                 maxLines: 1,
                      //                 overflow: TextOverflow.ellipsis,
                      //               ),
                      //               Text(
                      //                 '24/60,000',
                      //                 style: TextStyle(
                      //                     color: Colors.white, fontSize: 16),
                      //                 maxLines: 1,
                      //                 overflow: TextOverflow.ellipsis,
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(height: 10),
                      //           Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text(
                      //                 'รอบชาร์จแบตเตอรรี่',
                      //                 style: TextStyle(
                      //                     color: Colors.white, fontSize: 16),
                      //                 maxLines: 1,
                      //                 overflow: TextOverflow.ellipsis,
                      //               ),
                      //               Text(
                      //                 '24/60,000',
                      //                 style: TextStyle(
                      //                     color: Colors.white, fontSize: 16),
                      //                 maxLines: 1,
                      //                 overflow: TextOverflow.ellipsis,
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(height: 10),
                      //           Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text(
                      //                 'รอบชาร์จแบตเตอรรี่',
                      //                 style: TextStyle(
                      //                     color: Colors.white, fontSize: 16),
                      //                 maxLines: 1,
                      //                 overflow: TextOverflow.ellipsis,
                      //               ),
                      //               Text(
                      //                 '24/60,000',
                      //                 style: TextStyle(
                      //                     color: Colors.white, fontSize: 16),
                      //                 maxLines: 1,
                      //                 overflow: TextOverflow.ellipsis,
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(height: 10),
                      //           Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text(
                      //                 'รอบชาร์จแบตเตอรรี่',
                      //                 style: TextStyle(
                      //                     color: Colors.white, fontSize: 16),
                      //                 maxLines: 1,
                      //                 overflow: TextOverflow.ellipsis,
                      //               ),
                      //               Text(
                      //                 '24/60,000',
                      //                 style: TextStyle(
                      //                     color: Colors.white, fontSize: 16),
                      //                 maxLines: 1,
                      //                 overflow: TextOverflow.ellipsis,
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(height: 10),
                      //           Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text(
                      //                 'รอบชาร์จแบตเตอรรี่',
                      //                 style: TextStyle(
                      //                     color: Colors.white, fontSize: 16),
                      //                 maxLines: 1,
                      //                 overflow: TextOverflow.ellipsis,
                      //               ),
                      //               Text(
                      //                 '24/60,000',
                      //                 style: TextStyle(
                      //                     color: Colors.white, fontSize: 16),
                      //                 maxLines: 1,
                      //                 overflow: TextOverflow.ellipsis,
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(height: 10),
                      //           Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text(
                      //                 'รอบชาร์จแบตเตอรรี่',
                      //                 style: TextStyle(
                      //                     color: Colors.white, fontSize: 16),
                      //                 maxLines: 1,
                      //                 overflow: TextOverflow.ellipsis,
                      //               ),
                      //               Text(
                      //                 '24/60,000',
                      //                 style: TextStyle(
                      //                     color: Colors.white, fontSize: 16),
                      //                 maxLines: 1,
                      //                 overflow: TextOverflow.ellipsis,
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(height: 10),
                      //           Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text(
                      //                 'รอบชาร์จแบตเตอรรี่',
                      //                 style: TextStyle(
                      //                     color: Colors.white, fontSize: 16),
                      //                 maxLines: 1,
                      //                 overflow: TextOverflow.ellipsis,
                      //               ),
                      //               Text(
                      //                 '24/60,000',
                      //                 style: TextStyle(
                      //                     color: Colors.white, fontSize: 16),
                      //                 maxLines: 1,
                      //                 overflow: TextOverflow.ellipsis,
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(height: 10),
                      //           Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text(
                      //                 'รอบชาร์จแบตเตอรรี่',
                      //                 style: TextStyle(
                      //                     color: Colors.white, fontSize: 16),
                      //                 maxLines: 1,
                      //                 overflow: TextOverflow.ellipsis,
                      //               ),
                      //               Text(
                      //                 '24/60,000',
                      //                 style: TextStyle(
                      //                     color: Colors.white, fontSize: 16),
                      //                 maxLines: 1,
                      //                 overflow: TextOverflow.ellipsis,
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(height: 10),
                      //           Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text(
                      //                 'รอบชาร์จแบตเตอรรี่',
                      //                 style: TextStyle(
                      //                     color: Colors.white, fontSize: 16),
                      //                 maxLines: 1,
                      //                 overflow: TextOverflow.ellipsis,
                      //               ),
                      //               Text(
                      //                 '24/60,000',
                      //                 style: TextStyle(
                      //                     color: Colors.white, fontSize: 16),
                      //                 maxLines: 1,
                      //                 overflow: TextOverflow.ellipsis,
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InfoRow(
                              title: 'รอบชาร์จแบตเตอรรี่',
                              value: '24/60,000',
                            ),
                            SizedBox(height: 10),
                            InfoRow(
                              title: 'ระยะเวลาใช้งานรวม',
                              value: '245 h',
                            ),
                            SizedBox(height: 10),
                            InfoRow(
                              title: 'ระยะทางรวม',
                              value: '458 km',
                            ),
                            SizedBox(height: 10),
                            InfoRow(
                              title: 'ความเร็วโดยเฉลี่ย',
                              value: '52 km',
                            ),
                            SizedBox(height: 10),
                            InfoRow(
                              title: 'ระยะรับประกัน',
                              value: '2 y 11 m 20 d',
                            ),
                            SizedBox(height: 10),
                            InfoRow(
                              title: 'ETC.',
                              value: 'N',
                            ),
                            SizedBox(height: 10),
                            InfoRow(
                              title: 'ETC.',
                              value: 'N',
                            ),
                            SizedBox(height: 10),
                            InfoRow(
                              title: 'ETC.',
                              value: 'N',
                            ),
                            SizedBox(height: 10),
                            InfoRow(
                              title: 'ETC.',
                              value: 'N',
                            ),
                            SizedBox(height: 10),
                            InfoRow(
                              title: 'ETC.',
                              value: 'N',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
