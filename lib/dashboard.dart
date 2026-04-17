import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laundry_counter/addClothesModal.dart';
import 'package:laundry_counter/components/laundryCard.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int counter = 0;

  final List<Map<String, dynamic>> pakaianList = [
    {'label': 'Baju Rumah', 'image': 'assets/images/shirts.png', 'count': 0},
    {'label': 'Baju Bola', 'image': 'assets/images/football.png', 'count': 0},
    {'label': 'Celana Rumah', 'image': 'assets/images/shirts.png', 'count': 0},
    {'label': 'Kemeja Kantor', 'image': 'assets/images/shirts.png', 'count': 0},
    {'label': 'Celana Kantor', 'image': 'assets/images/shirts.png', 'count': 0},
    {'label': 'Kemeja Putih', 'image': 'assets/images/shirts.png', 'count': 0},
    {'label': 'Batik', 'image': 'assets/images/shirts.png', 'count': 0},
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Laundry Counter",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Total Baju: ",
                    style: TextStyle(fontSize: 25, color: Colors.grey),
                  ),
                  Text(
                    "$counter",
                    style: TextStyle(fontSize: 35, color: Colors.black),
                  ),
                  Spacer(),
                  IconButton.filledTonal(
                    iconSize: 30,
                    color: Color(0xFF008080),
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return BottomSheetContent(
                            screenHeight: screenHeight * 90 / 100,
                            onTambahJenis:
                                (List<Map<String, dynamic>> selected) {
                                  setState(() {
                                    for (var item in selected) {
                                      pakaianList.add({
                                        'label': item['label'],
                                        'image': item['image'],
                                        'count': 0,
                                      });
                                    }
                                  });
                                },
                          );
                        },
                      );
                    },
                    icon: FaIcon(FontAwesomeIcons.plusCircle),
                  ),
                  SizedBox(width: 10),
                  IconButton.filledTonal(
                    iconSize: 30,
                    color: Color(0xFFFF3131),
                    onPressed: () {
                      for (var item in pakaianList) {
                        item['count'] = 0;
                      }
                      setState(() {
                        counter = 0;
                      });
                    },
                    icon: FaIcon(FontAwesomeIcons.refresh),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ...pakaianList.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                return PakaianItem(
                  label: item['label'],
                  image: item['image'],
                  count: item['count'],
                  onAdd: () => setState(() {
                    pakaianList[index]['count']++;
                    counter++;
                  }),
                  onRemove: () {
                    if (pakaianList[index]['count'] > 0) {
                      setState(() {
                        pakaianList[index]['count']--;
                        counter--;
                      });
                    }
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
        child: SizedBox(
          height: 55,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.whatsapp,
              color: Colors.white,
              size: 30,
            ),
            label: const Text(
              "Share ke WhatsApp",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF25D366),
              foregroundColor: Colors.white,
              elevation: 3,
            ),
          ),
        ),
      ),
    );
  }
}
