import 'package:flutter/material.dart';

import 'package:greengrocer/src/screens/shared_widgets/app_text_field.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: ListView(
        physics:
            const BouncingScrollPhysics(), // best user experience for scrolling
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: const [
          AppTextField(
            icon: Icons.email,
            label: 'E-mail',
          ),
          AppTextField(icon: Icons.person, label: 'Name'),
          AppTextField(icon: Icons.phone, label: 'Phone number'),
          AppTextField(
            icon: Icons.file_copy,
            label: 'User document',
            isSecret: true,
          ),
        ],
      ),
    );
  }
}
