import 'package:flutter/material.dart';

import 'home_page.dart';


// ==========================================================
// LOGIN PAGE
// ==========================================================

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {

    // Menyimpan username dan password
    // selama halaman login digunakan
    String username = '';
    String password = '';


    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,

            children: [

              // =================================================
              // LOGO
              // =================================================

              const CircleAvatar(
                radius: 50,

                backgroundColor:
                    Colors.orange,

                child: Icon(
                  Icons.restaurant,
                  size: 55,
                  color: Colors.white,
                ),
              ),


              const SizedBox(height: 25),


              // =================================================
              // JUDUL
              // =================================================

              const Text(
                'Resto Kita',

                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),


              const SizedBox(height: 10),


              const Text(
                'Silakan login untuk melanjutkan',
              ),


              const SizedBox(height: 30),


              // =================================================
              // USERNAME
              // =================================================

              TextField(
                onChanged: (value) {
                  username = value;
                },

                decoration: InputDecoration(
                  labelText: 'Username',

                  prefixIcon:
                      const Icon(Icons.person),

                  border:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                  ),
                ),
              ),


              const SizedBox(height: 15),


              // =================================================
              // PASSWORD
              // =================================================

              TextField(
                obscureText: true,

                onChanged: (value) {
                  password = value;
                },

                decoration: InputDecoration(
                  labelText: 'Password',

                  prefixIcon:
                      const Icon(Icons.lock),

                  border:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                  ),
                ),
              ),


              const SizedBox(height: 25),


              // =================================================
              // LOGIN
              // =================================================

              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                  onPressed: () {

                    // Mengecek input
                    if (username.isEmpty ||
                        password.isEmpty) {

                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Username dan password harus diisi',
                          ),
                        ),
                      );

                      return;
                    }


                    // Membuka HomePage
                    Navigator.pushReplacement(
                      context,

                      MaterialPageRoute(
                        builder: (context) =>
                            const HomePage(),
                      ),
                    );
                  },

                  child: const Text(
                    'LOGIN',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}