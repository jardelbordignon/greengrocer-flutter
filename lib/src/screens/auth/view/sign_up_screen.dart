import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/screens/auth/controller/auth_controller.dart';
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
  final authController = Get.find<AuthController>();

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
                            onSaved: (value) {
                              authController.user.email = value;
                            },
                          ),
                          AppTextField(
                            icon: Icons.lock,
                            label: 'Password',
                            isSecret: true,
                            validator: Zod().password().build,
                            onSaved: (value) {
                              authController.user.password = value;
                            },
                          ),
                          AppTextField(
                            icon: Icons.person,
                            label: 'Name',
                            validator: Zod().type<String>().min(3).build,
                            onSaved: (value) {
                              authController.user.name = value;
                            },
                          ),
                          AppTextField(
                            icon: Icons.phone,
                            label: 'Phone',
                            inputFormatters: [phoneFormatter],
                            textInputType: TextInputType.number,
                            validator: Zod().min(14).build,
                            onSaved: (value) {
                              authController.user.phone = value;
                            },
                          ),
                          AppTextField(
                            icon: Icons.file_copy,
                            label: 'Document Number',
                            inputFormatters: [cpfFormatter],
                            textInputType: TextInputType.number,
                            validator: Zod().cpf().build,
                            onSaved: (value) {
                              authController.user.document = value;
                            },
                          ),
                          SizedBox(
                            height: 50,
                            child: Obx(
                              () => ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                                onPressed: authController.isLoading.value
                                    ? null
                                    : () async {
                                        FocusScope.of(context).unfocus();

                                        if (_formKey.currentState!.validate()) {
                                          // activates onSaved methods in the AppTextFields
                                          _formKey.currentState!.save();

                                          //print(authController.user);
                                          authController.signUp();
                                        }
                                      },
                                child: authController.isLoading.value
                                    ? const SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: CircularProgressIndicator(
                                            strokeWidth: 2),
                                      )
                                    : const Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
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
