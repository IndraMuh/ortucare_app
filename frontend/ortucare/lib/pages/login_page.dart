import 'package:flutter/material.dart';
import 'package:ortucare/services/user.dart';
import 'package:ortucare/widgets/alert.dart';
import 'package:ortucare/widgets/const.dart';

class LoginOrtuPage extends StatefulWidget {
  @override
  State<LoginOrtuPage> createState() => _LoginOrtuPageState();
}

class _LoginOrtuPageState extends State<LoginOrtuPage> {
  void _showForgotPasswordDialog() {
    bool obscureNew = true;
    bool obscureConfirm = true;

    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(
            "Reset Password",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: forgotEmailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: newPasswordController,
                  obscureText: obscureNew,
                  decoration: InputDecoration(
                    labelText: "Password Baru",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureNew ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() => obscureNew = !obscureNew);
                      },
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: confirmPasswordController,
                  obscureText: obscureConfirm,
                  decoration: InputDecoration(
                    labelText: "Konfirmasi Password",
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureConfirm
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() => obscureConfirm = !obscureConfirm);
                      },
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text("Batal"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton.icon(
              icon: isForgotLoading
                  ? SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white),
                    )
                  : Icon(Icons.send),
              label: Text("Kirim"),
              onPressed: isForgotLoading
                  ? null
                  : () async {
                      if (forgotEmailController.text.isEmpty ||
                          newPasswordController.text.isEmpty ||
                          confirmPasswordController.text.isEmpty) {
                        AlertMessage().showAlert(
                            context, "Semua field wajib diisi", false);
                        return;
                      }

                      if (newPasswordController.text !=
                          confirmPasswordController.text) {
                        AlertMessage()
                            .showAlert(context, "Password tidak cocok", false);
                        return;
                      }

                      setState(() {
                        isForgotLoading = true;
                      });

                      var result = await user.forgotPassword({
                        "email": forgotEmailController.text,
                        "new_password": newPasswordController.text,
                        "new_password_confirmation":
                            confirmPasswordController.text,
                      });

                      setState(() {
                        isForgotLoading = false;
                      });

                      AlertMessage()
                          .showAlert(context, result.message, result.status);

                      if (result.status == true) {
                        Navigator.of(context).pop();
                      }
                    },
            ),
          ],
        ),
      ),
    );
  }

  UserService user = UserService();
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController forgotEmailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isForgotLoading = false;
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.1),
                child: Text(
                  "Welcome to",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.1),
                child: Text(
                  "OrtuCare",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                      color: pinkTua,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Container(
            child: Text(
              "Let's start your smarter parenting",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.width * 0.1),
            child: Text(
              "journey today!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.03,
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
                  // Username
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
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

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: _showForgotPasswordDialog,
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.02),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 0.1,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: pinkTua, // Warna tombol
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            var data = {
                              "email": email.text,
                              "password": password.text,
                            };
                            var result = await user.loginUser(data);
                            setState(() {
                              isLoading = false;
                            });
                            print(result.message);
                            if (result.status == true) {
                              AlertMessage()
                                  .showAlert(context, result.message, true);
                              Future.delayed(Duration(seconds: 2), () {
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              });
                            } else {
                              AlertMessage()
                                  .showAlert(context, result.message, false);
                            }
                          }
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                  const SizedBox(height: 1),
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
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            color: pinkTua,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            'assets/login.png', // Ganti dengan path gambar kamu
            height: MediaQuery.of(context).size.width * 1,
          ),
        ],
      ),
    );
  }
}
