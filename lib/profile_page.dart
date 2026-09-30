import 'package:flutter/material.dart';

import 'app_state.dart';
import 'login_page.dart';


// ==========================================================
// PROFILE PAGE
// ==========================================================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});


  @override
  Widget build(BuildContext context) {

    return Center(

      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [

          // Foto/profile icon
          const CircleAvatar(
            radius: 50,

            child: Icon(
              Icons.person,
              size: 60,
            ),
          ),


          const SizedBox(height: 20),


          // Judul
          const Text(
            'Profile Pelanggan',

            style: TextStyle(
              fontSize: 24,
              fontWeight:
                  FontWeight.bold,
            ),
          ),


          const SizedBox(height: 10),


          // Nama
          const Text(
            'Nama Pelanggan',

            style: TextStyle(
              fontSize: 18,
            ),
          ),


          const SizedBox(height: 5),


          const Text(
            'Pelanggan Resto Kita',

            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 28),

          OutlinedButton.icon(
            onPressed: () async {
              final bool shouldLogout = await showDialog<bool>(
                    context: context,
                    builder: (dialogContext) => AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Apakah Anda yakin ingin keluar?'),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(dialogContext, false),
                          child: const Text('Batal'),
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(dialogContext, true),
                          child: const Text('Keluar'),
                        ),
                      ],
                    ),
                  ) ??
                  false;

              if (!shouldLogout || !context.mounted) return;

              selectedIndex.value = 0;
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
            label: const Text('Keluar'),
          ),
        ],
      ),
    );
  }
}