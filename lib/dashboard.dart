import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int counter = 0;
  int counterbajurumah = 0;
  int counterbajubola = 0;
  @override
  Widget build(BuildContext context) {
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
                  IconButton(
                    iconSize: 30,
                    color: Color(0xFF008080),
                    onPressed: () {
                      setState(() {
                        counter = 0;
                        counterbajurumah = 0;
                        counterbajubola = 0;
                      });
                    },
                    icon: FaIcon(FontAwesomeIcons.plusCircle),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // 👕 Icon
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        "assets/images/shirts.png",
                        width: 40,
                        height: 40,
                      ),
                    ),

                    const SizedBox(width: 12),

                    // 🏷️ Nama item
                    const Expanded(
                      child: Text(
                        "Shirt",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    // ➖ Button
                    GestureDetector(
                      onTap: () {
                        if (counterbajurumah > 0) {
                          setState(() {
                            counterbajurumah--;
                            counter--;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.remove, size: 18),
                      ),
                    ),

                    const SizedBox(width: 10),

                    // 🔢 Counter
                    Text(
                      "$counterbajurumah",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(width: 10),

                    // ➕ Button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          counterbajurumah++;
                          counter++;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // 👕 Icon
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        "assets/images/football.png",
                        width: 40,
                        height: 40,
                      ),
                    ),

                    const SizedBox(width: 12),

                    // 🏷️ Nama item
                    const Expanded(
                      child: Text(
                        "Football Shirt",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    // ➖ Button
                    GestureDetector(
                      onTap: () {
                        if (counterbajubola > 0) {
                          setState(() {
                            counterbajubola--;
                            counter--;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.remove, size: 18),
                      ),
                    ),

                    const SizedBox(width: 10),

                    // 🔢 Counter
                    Text(
                      "$counterbajubola",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(width: 10),

                    // ➕ Button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          counterbajubola++;
                          counter++;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Text("Laundry Counter"),
              // Text("Laundry Counter"),
              // Text("Laundry Counter"),
              // Text("Laundry Counter"),
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
