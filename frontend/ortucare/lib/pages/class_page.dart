import 'package:flutter/material.dart';
import 'package:ortucare/models/class_model.dart';
import 'package:ortucare/widgets/bottom_nav.dart';

class ClassPage extends StatefulWidget {
  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenWidth * 0.2),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: Container(
            margin: EdgeInsets.only(top: screenWidth * 0.09),
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenWidth * 0.7,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "How about parenting...",
                      prefixIcon: Icon(Icons.search, color: Colors.pink),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.pink, width: 2),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth * 0.1,
                  height: screenWidth * 0.1,
                  margin: EdgeInsets.only(right: screenWidth * 0.02),
                  child: Image.asset('assets/bar.png'),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: screenWidth * 0.06),
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose your class",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.07,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: classList.length,
                itemBuilder: (context, index) {
                  return ClassCard(model: classList[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(1),
    );
  }
}

class ClassCard extends StatelessWidget {
  final ClassModel model;

  const ClassCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // Aksi ketika gambar ditekan
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Kamu memilih: ${model.title}')),
        );
        // Bisa juga navigasi ke halaman detail, dll.
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            model.iconAsset,
            width: double.infinity,
            height: screenWidth * 0.3,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
