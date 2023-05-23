import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:future_api/model/weather.dart';
import 'package:future_api/widgets/berandaContainer.dart';
import 'package:future_api/widgets/customNavButton.dart';
import 'package:future_api/widgets/slider.dart';

class TripScreen extends StatefulWidget {
  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  dynamic lokasi = 'load';
  dynamic suhu = 'load';
  dynamic status = 'load';
  dynamic icon = '//w7.pngwing.com/pngs/164/641/png-transparent-logo-business-please-wait-angle-text-hand.png';

  List<Map<String, dynamic>> allPaket = [
    {
      'judul': 'Yogyakarta',
      'gambar': 'https://static.saltinourhair.com/wp-content/uploads/2018/09/23151338/things-to-do-yogyakarta-borobudur-header.jpg'
    },
    {
      'judul': 'Bali',
      'gambar': 'https://booking-bali-villas.com/bali/wp-content/uploads/2014/06/Tari-Kecak.jpg'
    },
    {
      'judul': 'Pontianak',
      'gambar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZtwCaueTtasBaO2_Rn_fgDyipJe8yU8wfbA&usqp=CAU'
    },
  ];

  List<Map<String, dynamic>> allBudaya = [
    {
      'judul': 'Bali',
      'gambar': 'https://asset.kompas.com/crops/P446A8gbHJYKkwyXLUbAopflPrA=/0x0:740x493/750x500/data/photo/2020/09/17/5f6315bd84932.jpg'
    },
    {
      'judul': 'Dayak',
      'gambar': 'https://cdn-2.tstatic.net/belitung/foto/bank/images/20230224-Upacara-Penganten-Mandai-Suku-Dayak-Ngaju-net.jpg'
    },
    {
      'judul': 'Jawa',
      'gambar': 'https://mmc.tirto.id/image/otf/500x0/2020/08/20/antarafoto-tradisi-kirab-sura-girikusumo-200820-ast-9_ratio-16x9.jpg'
    },
  ];

  final API = new WeatherAPI();

  loadAPI() {
    API.fetchData().then((response) {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          lokasi = '${data['location']['name']}\n${data['location']['country']}';
          suhu = data['current']['temp_c'];
          status = data['current']['condition']['text'];
          icon = data['current']['condition']['icon'];
        });
      } else {
        throw Exception('Failed to load data');
      }
    }).catchError((error) {
      print(error);
    });
  }

  int _selectedIndex = 5;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   loadAPI();
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(fit: StackFit.expand, children: [
        SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 350,
                  child: Stack(children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: SliderImage(),
                    ),
                    Positioned(
                      bottom: 40,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(102, 236, 236, 236),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 60,
                          child: FutureBuilder<List<dynamic>>(
                              future: loadAPI(),
                              builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else {
                                  if (snapshot.hasError) {
                                    return Text('Failed to load data from API');
                                  } else {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          lokasi,
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${suhu}`C',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 50,
                                              child: Text(
                                                status,
                                                maxLines: 2,
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Image(
                                              image: NetworkImage('https:${icon}'),
                                              width: 40,
                                              height: 40,
                                            )
                                          ],
                                        )
                                      ],
                                    );
                                  }
                                }
                              }),
                        ),
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Paket Wisata',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                            children: allPaket.map((paket) {
                          return BerandaContainer(
                            textContent: 'Culture Trip \n${paket['judul']}',
                            photoContent: paket['gambar'],
                          );
                        }).toList()),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Inspirasi Budaya',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                            children: allBudaya.map((data) {
                          return BerandaContainer(
                            textContent: data['judul'],
                            photoContent: data['gambar'],
                          );
                        }).toList()),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          bottom: 10,
          right: 0,
          child: CustomNavButton(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
        ),
      ]),
    );
  }
}
