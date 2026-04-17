// bottom_sheet_content.dart
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BottomSheetContent extends StatefulWidget {
  final double screenHeight;
  final Function(List<Map<String, dynamic>>) onTambahJenis;

  const BottomSheetContent({
    super.key,
    required this.screenHeight,
    required this.onTambahJenis,
  });

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  List<Map<String, dynamic>> get items => [
    {'label': 'Sweater', 'image': "assets/images/hoodie.png"},
    {'label': 'Jacket', 'image': "assets/images/jacket.png"},
    {'label': 'Jeans', 'image': "assets/images/hoodie.png"},
    {'label': 'Topi', 'image': "assets/images/hoodie.png"},
    {'label': 'Kaos Polo', 'image': "assets/images/hoodie.png"},
    {'label': 'Sprei', 'image': "assets/images/hoodie.png"},
    {'label': 'Selimut', 'image': "assets/images/hoodie.png"},
    {'label': 'Celana Pendek Pergi', 'image': "assets/images/hoodie.png"},
    {'label': 'Tambah Jenis', 'image': "assets/images/laundry.png"},
  ];

  final TextEditingController namaController = TextEditingController();

  List<Map<String, dynamic>> itemSelected = [];

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
                    color: Color(0xFF7393B3),
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
              itemCount: items.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (items[index]['label'] == 'Tambah Jenis') {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Tambah Jenis Pakaian'),
                            content: TextField(
                              controller: namaController,
                              decoration: InputDecoration(
                                labelText: 'Nama Jenis Pakaian',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  'Batal',
                                  style: TextStyle(color: Color(0xFF6082B6)),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 2,
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xFF6082B6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      8.0,
                                    ),
                                  ),
                                ),

                                onPressed: () {
                                  if (namaController.text.isNotEmpty) {
                                    setState(() {
                                      itemSelected.add({
                                        'label': namaController.text,
                                        'image': "assets/images/hoodie.png",
                                      });
                                    });
                                    widget.onTambahJenis(itemSelected);
                                    Navigator.pop(context);
                                  }
                                  Navigator.pop(context);
                                },
                                child: const Text('Simpan'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      setState(() {
                        itemSelected.add({
                          'label': items[index]['label'],
                          'image': items[index]['image'],
                        });
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          itemSelected.any(
                            (e) => e['label'] == items[index]['label'],
                          )
                          ? const Color(0xFF008080).withOpacity(0.3)
                          : const Color(0xFF008080).withOpacity(0.08),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color:
                            itemSelected.any(
                              (e) => e['label'] == items[index]['label'],
                            )
                            ? const Color(0xFF008080)
                            : const Color(0xFF008080).withOpacity(0.3),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                onPressed: () {
                  widget.onTambahJenis(itemSelected);
                  Navigator.pop(context);
                },
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
