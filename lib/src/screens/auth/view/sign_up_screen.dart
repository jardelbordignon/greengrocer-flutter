import 'package:flutter/material.dart';
import 'package:greengrocer/src/screens/shared_widgets/app_text_field.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:zod_validation/zod_validation.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );
  final phoneFormatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            // Stack is used to add widgets in the background
            children: [
              // Back button
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              // Content
              Column(
                children: [
                  // Title
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),

                  // Formulary
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          AppTextField(
                            icon: Icons.email,
                            label: 'Email',
                            validator: Zod().min(6).email().build,
                            textInputType: TextInputType.emailAddress,
                          ),
                          AppTextField(
                            icon: Icons.lock,
                            label: 'Password',
                            isSecret: true,
                            validator: Zod().min(7).build,
                          ),
                          AppTextField(
                            icon: Icons.person,
                            label: 'Name',
                            validator: Zod().type<String>().min(3).build,
                          ),
                          AppTextField(
                            icon: Icons.phone,
                            label: 'Phone',
                            inputFormatters: [phoneFormatter],
                            textInputType: TextInputType.number,
                            validator: Zod().min(14).build,
                          ),
                          AppTextField(
                              icon: Icons.file_copy,
                              label: 'Document Number',
                              inputFormatters: [cpfFormatter],
                              textInputType: TextInputType.number,
                              validator: Zod().cpf().build),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: Colors.green,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  print('Validated');
                                }
                              },
                              child: const Text(
                                'Sign Up Now',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
