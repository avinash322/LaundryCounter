// bottom_sheet_content.dart
import 'package:flutter/material.dart';

class BottomSheetContent extends StatefulWidget {
  final double screenHeight;

  const BottomSheetContent({super.key, required this.screenHeight});

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  int countersweater = 0;
  int counterjacket = 0;
  int counterjeans = 0;
  int countertopi = 0;
  int counterkaospolo = 0;
  int countersprei = 0;
  int selimut = 0;
  int celanapendekpergi = 0;

  List<Map<String, dynamic>> get items => [
    {
      'label': 'Sweater',
      'counter': countersweater,
      'image': "assets/images/hoodie.png",
    },
    {
      'label': 'Jacket',
      'counter': counterjacket,
      'image': "assets/images/jacket.png",
    },
    {
      'label': 'Jeans',
      'counter': counterjeans,
      'image': "assets/images/hoodie.png",
    },
    {
      'label': 'Topi',
      'counter': countertopi,
      'image': "assets/images/hoodie.png",
    },
    {
      'label': 'Kaos Polo',
      'counter': counterkaospolo,
      'image': "assets/images/hoodie.png",
    },
    {
      'label': 'Sprei',
      'counter': countersprei,
      'image': "assets/images/hoodie.png",
    },
    {
      'label': 'Selimut',
      'counter': selimut,
      'image': "assets/images/hoodie.png",
    },
    {
      'label': 'Celana Pendek Pergi',
      'counter': celanapendekpergi,
      'image': "assets/images/hoodie.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.screenHeight * 0.9,
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Pilih Item',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          const Divider(thickness: 3.0),

          // Content Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.2,
              ),
              itemCount: items.length, // ganti sesuai data
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF008080).withOpacity(0.08),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFF008080).withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon(
                      //   Icons.checkroom,
                      //   color: const Color(0xFF008080),
                      //   size: 32,
                      // ),
                      Image.asset(
                        items[index]['image'],
                        width: widget.screenHeight * 0.1,
                        height: widget.screenHeight * 0.1,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        items[index]['label'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF008080),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Bottom Button
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF008080),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Konfirmasi',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
