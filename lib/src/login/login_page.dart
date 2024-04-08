import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/src/login/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'assets/login.png',
                    width: 200,
                    height: 200,
                  ),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(label: Text('E-mail')),
                    validator: (value) {
                      if (value!.isEmpty) return 'Campo obrigatório';
                      if (!GetUtils.isEmail(value)) return 'E-mail inválido';
                              
                      return null;
                    },
                  ),
                  Obx(() {
                    return TextFormField(
                      obscureText: controller.obscureText,
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        label: const Text('Senha'),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.obscureText = !controller.obscureText;
                          },
                          icon: Icon(
                            controller.obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return 'Campo obrigatório';
                        return null;
                      },
                    );
                  }),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Esqueci minha senha',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.purple,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          spreadRadius: 0.4,
                          blurRadius: 0.4,
                          offset: const Offset(-1, 1),
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () => controller.signIn(context),
                      child: const Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
