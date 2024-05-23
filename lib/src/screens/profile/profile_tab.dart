import 'package:flutter/material.dart';

import 'package:greengrocer/src/config/mocked_data.dart' as mocked_data;
import 'package:greengrocer/src/screens/shared_widgets/app_text_field.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
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
              onPressed: () {
                showUpdatePasswordForm();
              },
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

  Future<bool?> showUpdatePasswordForm() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              // Form
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .stretch, // maximize your children width
                  mainAxisSize: MainAxisSize.min, // minimize the vertical size
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Update password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const AppTextField(
                      icon: Icons.lock,
                      label: 'Current password',
                      isSecret: true,
                    ),
                    const AppTextField(
                      icon: Icons.lock_outline,
                      label: 'New password',
                      isSecret: true,
                    ),
                    const AppTextField(
                      icon: Icons.lock_outline,
                      label: 'Confirm new password',
                      isSecret: true,
                    ),
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Update',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Close button
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
