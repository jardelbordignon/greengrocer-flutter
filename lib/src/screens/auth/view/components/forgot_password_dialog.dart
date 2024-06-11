import 'package:flutter/material.dart';
import 'package:zod_validation/zod_validation.dart';

import 'package:greengrocer/src/screens/shared_widgets/app_text_field.dart';

class ForgotPasswordDialog extends StatelessWidget {
  final emailController = TextEditingController();
  final formFieldKey = GlobalKey<FormFieldState>();

  ForgotPasswordDialog({
    required String email,
    super.key,
  }) {
    emailController.text = email;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Conteúdo
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Titulo
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Recuperação de senha',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),

                // Descrição
                const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                  ),
                  child: Text(
                    'Digite seu email para recuperar sua senha',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                ),

                // Campo de email
                AppTextField(
                  formFieldKey: formFieldKey,
                  controller: emailController,
                  icon: Icons.email,
                  label: 'Email',
                  validator: Zod().min(6).email().build,
                ),

                // Confirmar
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(
                      width: 2,
                      color: Colors.green,
                    ),
                  ),
                  onPressed: () {
                    if (formFieldKey.currentState!.validate()) {
                      print('validate');
                      //Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    'Recuperar',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Botão para fechar
          Positioned(
            top: 0,
            right: 0,
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
  }
}
