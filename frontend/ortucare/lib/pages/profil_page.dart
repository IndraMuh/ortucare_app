import 'package:flutter/material.dart';
import 'package:ortucare/models/user_login.dart';
import 'package:ortucare/services/user.dart';
import 'package:ortucare/widgets/bottom_nav.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserLogin userLogin = UserLogin();
  String? username;
  String? email;
  getUserLogin() async {
    var user = await userLogin.getUserLogin();
    if (user.status != false) {
      setState(() {
        username = user.username;
        email = user.email;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLogin();
  }

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/article1.png'),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mother $username",
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.email, size: 16),
                          SizedBox(width: 4),
                          Text(
                            "$email",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: screenWidth * 0.1,
                    height: screenWidth * 0.1,
                    margin: EdgeInsets.only(right: screenWidth * 0.02),
                    child: Image.asset('assets/bar.png'),
                  ),
                ],
              ),

              SizedBox(height: 30),
              Text("Akun",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              SizedBox(height: 10),

              // Interaktif
              buildProfileItem(Icons.star_border, "Subscribe", () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Berlangganan sekarang untuk fitur premium!"),
                    duration: Duration(seconds: 3),
                  ),
                );
              }),

              buildProfileItem(Icons.language, "Language", () {
                // Nanti bisa ditambahkan jika ada fitur ganti bahasa
              }),

              buildProfileItem(Icons.settings, "Settings", () {
                // Nanti bisa ditambahkan jika ada fitur settings
              }),

              SizedBox(height: 20),
              Text("More Info",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              SizedBox(height: 10),

              buildProfileItem(Icons.logout, "Log Out", () async {
                await UserService().logout(); // panggil fungsi logout
                Navigator.pushReplacementNamed(
                    context, '/login'); // kembali ke halaman login
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(3),
    );
  }

  Widget buildProfileItem(IconData icon, String title, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, size: 24, color: Colors.black),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
