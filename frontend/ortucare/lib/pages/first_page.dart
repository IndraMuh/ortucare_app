import 'package:flutter/material.dart';
import 'package:ortucare/widgets/const.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.08),
            child: Text(
              "OrtuCare",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  color: pinkMuda,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.width * 2,
              color: Colors.white,
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.width * 0.15,
              left: MediaQuery.of(context).size.width * 0.01,
              right: MediaQuery.of(context).size.width * 0.01,
              child: Container(
                height: MediaQuery.of(context).size.width * 2,
                width: MediaQuery.of(context).size.width * 2,
                child: Image.asset(
                  'assets/first.png', // Ganti dengan path gambar kamu
                  height: MediaQuery.of(context).size.width * 2,
                  width: MediaQuery.of(context).size.width * 2,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width * 0.1,
              left: MediaQuery.of(context).size.width * 0.01,
              right: MediaQuery.of(context).size.width * 0.1,
              child: Text(
                "Nice to meet you!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width * 0.2,
              left: MediaQuery.of(context).size.width * 0.01,
              right: MediaQuery.of(context).size.width * 0.13,
              child: Text(
                "Let's create your",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width * 0.3,
              left: MediaQuery.of(context).size.width * 0.01,
              right: MediaQuery.of(context).size.width * 0.48,
              child: Text(
                "account",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width * 0.44,
              left: MediaQuery.of(context).size.width * 0.1,
              right: MediaQuery.of(context).size.width * 0.1,
              child: Container(
                margin:
                    EdgeInsets.only(top: MediaQuery.of(context).size.width * 1),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pinkMuda,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
