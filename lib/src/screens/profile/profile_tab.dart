import 'package:flutter/material.dart';

import 'package:greengrocer/src/config/mocked_data.dart' as mocked_data;
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
        children: [
          AppTextField(
            icon: Icons.email,
            label: 'E-mail',
            initialValue: mocked_data.user.email,
            readOnly: true,
          ),
          AppTextField(
            icon: Icons.person,
            label: 'Name',
            initialValue: mocked_data.user.name,
            readOnly: true,
          ),
          AppTextField(
            icon: Icons.phone,
            label: 'Phone number',
            initialValue: mocked_data.user.phone,
            readOnly: true,
          ),
          AppTextField(
            icon: Icons.file_copy,
            label: 'User document',
            isSecret: true,
            readOnly: true,
            initialValue: mocked_data.user.document,
          ),

          // button to change password
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(
                  color: Colors.green,
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Change password',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
