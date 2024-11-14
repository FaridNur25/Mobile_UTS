import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      extendBodyBehindAppBar: true, // Agar AppBar menyatu dengan background
      body: Column(
        children: [
          // Header with background image
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/background.png'), // Ganti dengan path gambar background Anda
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      'images/profile.png', // Ganti dengan path gambar profil Anda
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60), // Offset for avatar
          // Profile details with labels and separators
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _profileDetail('Nama Lengkap:', 'Farid Nurtaufiq'),
                const Divider(color: Colors.white),
                const SizedBox(height: 8),
                _profileDetail('Tanggal Lahir:', '1 Januari 1990'),
                const Divider(color: Colors.white),
                const SizedBox(height: 8),
                _profileDetail('E-Mail:', 'faridnurtaufiq@example.com'),
                const Divider(color: Colors.white),
                const SizedBox(height: 8),
                _profileDetail('Gender:', 'Laki-laki'),
                const Divider(color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for profile details with label
  Widget _profileDetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
