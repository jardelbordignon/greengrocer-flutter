import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/config/mocked_data.dart' as mocked_data;
import 'package:greengrocer/src/screens/router.dart';
import 'package:greengrocer/src/screens/shared_widgets/app_name_widget.dart';
import 'package:greengrocer/src/screens/shared_widgets/app_text_field.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:zod_validation/zod_validation.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

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
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // App name
                    const AppNameWidget(fontSize: 40),

                    // Categories
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: const TextStyle(fontSize: 25),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          pause: Duration.zero,
                          // animatedTexts: [
                          //   FadeAnimatedText('Frutas'),
                          //   FadeAnimatedText('Verduras'),
                          //   FadeAnimatedText('Legumes'),
                          //   FadeAnimatedText('Carnes'),
                          //   FadeAnimatedText('Cereais'),
                          //   FadeAnimatedText('Laticínios'),
                          // ],
                          animatedTexts: mocked_data.categories
                              .map((category) => FadeAnimatedText(category))
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Formulary
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween, // space between
                    crossAxisAlignment:
                        CrossAxisAlignment.stretch, // align-items stretch
                    children: [
                      // Email
                      AppTextField(
                        icon: Icons.email,
                        label: 'Email',
                        validator: Zod().min(6).email().build,
                      ),
                      // Password
                      AppTextField(
                        icon: Icons.lock,
                        label: 'Password',
                        isSecret: true,
                        validator: Zod().min(7).password().build,
                      ),

                      // Sign In button
                      SizedBox(
                        height: 50,
                        //width: 200,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            // when sign in replace navigation stack with BaseScreen
                            // Navigator.of(context).pushReplacement(
                            //     MaterialPageRoute(builder: (context) {
                            //   return const BaseScreen();
                            // }));
                            if (_formKey.currentState!.validate()) {
                              Get.offNamed(Routes.base);
                            }
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: CustomColors.customContrastColor,
                            ),
                          ),
                        ),
                      ),

                      // Divider
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 12),
                            child: Text('or'),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),

                      // Sign Up
                      SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: const BorderSide(
                              width: 2,
                              color: Colors.green,
                            ),
                          ),
                          onPressed: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return SignUpScreen();
                            //     },
                            //   ),
                            // );
                            Get.toNamed(Routes.signUp);
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
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
