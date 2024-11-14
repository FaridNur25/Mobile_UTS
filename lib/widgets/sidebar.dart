import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Fareed Noor'),
            accountEmail: Text('fareednoor112@outlook.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'images/profile.png', // Ganti dengan path gambar yang sesuai
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'images/background.png', // Ganti dengan path gambar yang sesuai
                ),
                fit: BoxFit.cover, // Pastikan gambar mencakup seluruh background
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: Text('Calculator'),
            onTap: () {
              Navigator.of(context).pop();  // Menutup sidebar
              Navigator.of(context).pushNamed('/calculator');
            },
          ),
          ListTile(
            leading: Icon(Icons.monitor_weight_rounded),
            title: Text('BMI'),
            onTap: () {
              Navigator.of(context).pop();  // Menutup sidebar
              Navigator.of(context).pushNamed('/bmi');
            },
          ),
          ListTile(
            leading: Icon(Icons.thermostat),
            title: Text('Konversi Suhu'),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/thermo');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/profile');
            },
          )
        ],
      ),
    );
  }
}
