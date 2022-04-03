import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Email',
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo),
                ),
              ),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                labelText: 'Password',
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  primary: Colors.indigo),
              icon: const Icon(Icons.lock_open, size: 32),
              label: const Text('Sign In', style: TextStyle(fontSize: 24)),
              onPressed: signIn,
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Future signIn() async {}
}
