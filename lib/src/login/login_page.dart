import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/src/login/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.emailController,
              decoration: const InputDecoration(label: Text('E-mail')),
              validator: (value) {
                if (value!.isEmpty) return 'Campo obrigatório';
                if (!GetUtils.isEmail(value)) return 'E-mail inválido';

                return null;
              },
            ),
            TextFormField(
              controller: controller.passwordController,
              decoration: const InputDecoration(label: Text('Senha')),
              validator: (value) {
                if (value!.isEmpty) return 'Campo obrigatório';
                return null;
              },
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  spreadRadius: 0.4,
                  blurRadius: 0.4,
                  offset: const Offset(-1, 1),
                ),
              ]),
              child: TextButton(
                onPressed: () => controller.signIn(context),
                child: const Text('Entrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
