import 'package:flutter/material.dart';


class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Developers: Franz Dave Apid & Peter Segovia', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Name of the Course: CIT 238 Mobile Applications Development', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Name of the Professor: Prof. John Cristopher Mateo', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Navigation',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            title: Text('Logo'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: Text('Plant Types'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/homepage');
            },
          ),
          ListTile(
            title: Text('About Us'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/aboutus');
            },
          ),
        ],
      ),
    );
  }
}