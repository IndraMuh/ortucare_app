import 'package:flutter/material.dart';
import 'package:ortucare/services/user.dart';
import 'package:ortucare/widgets/alert.dart';
import 'package:ortucare/widgets/const.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  UserService user = UserService();
  final formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isLoading = false;
  bool showPass = true;
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
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.1),
            child: Text(
              "First create a account",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.07,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 0.15,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.15),
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10), // Sudut melengkung
                      border: Border.all(color: Colors.grey), // Garis tepi
                    ),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: username,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person_outlined),
                        label: Text("username"),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'username wajib diisi';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.02),
                    height: MediaQuery.of(context).size.width * 0.15,
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10), // Sudut melengkung
                      border: Border.all(color: Colors.grey), // Garis tepi
                    ),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: email,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email_outlined),
                        label: Text("email"),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'email wajib diisi';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 0.15,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.02),
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10), // Sudut melengkung
                      border: Border.all(color: Colors.grey), // Garis tepi
                    ),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: password,
                      obscureText: showPass,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.password_outlined),
                        label: Text("Password"),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPass = !showPass;
                            });
                          },
                          icon: showPass
                              ? Icon(Icons.visibility_outlined)
                              : Icon(Icons.visibility_off_outlined),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password wajib diisi';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pinkTua,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        var data = {
                          "username": username.text,
                          "email": email.text,
                          "password": password.text,
                        };
                        var result = await user.registerUser(data);
                        if (result.status == true) {
                          username.clear();
                          email.clear();
                          password.clear();
                          setState(() {});
                          var result = await user.loginUser(data);
                          setState(() {
                            isLoading = false;
                          });
                          AlertMessage()
                              .showAlert(context, result.message, true);
                          Navigator.pushReplacementNamed(context, '/login');
                        } else {
                          AlertMessage()
                              .showAlert(context, result.message, false);
                        }
                      }
                    },
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text("Create Account",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.02),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 0.1,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: Colors.black, width: 0.2),
                          backgroundColor: Colors.white, // Warna tombol
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: Text(
                          "I Already Have Account",
                          style: TextStyle(
                            color: pinkTua,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
