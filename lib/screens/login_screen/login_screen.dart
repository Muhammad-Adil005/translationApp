import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:translation_app/screens/login_screen/widgets/continue_with_google.dart';
import 'package:translation_app/utils/extensions/extensions.dart';

import '../../utils/signin_Signup_Reusable_widget.dart';
import '../sign_up_screen/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final FormGroup loginForm = FormGroup({
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email]),
    'password': FormControl<String>(
        validators: [Validators.required, Validators.minLength(6)]),
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ReactiveForm(
        formGroup: loginForm,
        child: Scaffold(
          // backgroundColor: const Color(0xff0073E8),
          backgroundColor: Colors.white,
          body: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to Instant Translator generator',
                        style: GoogleFonts.robotoSerif(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Column(
                          children: [
                            ReactiveTextField(
                              formControlName: 'email',
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(14),
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            ReactiveTextField(
                              formControlName: 'password',
                              obscureText: true,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(14),
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            ReusableButton(
                              text: 'Sign In',
                              color: const Color(0xff10244B),
                              onPressed: () {},
                            ),
                            const SizedBox(height: 32),
                            ContinueWithGoogleButton(
                              text: 'Continue with Google',
                              color: Colors.black12,
                              //image: 'assets/images/Google.png',
                              image: 'Google'.pngImage,
                              onPressed: () {},
                            ),
                            const SizedBox(height: 32),
                            Text.rich(
                              TextSpan(
                                text: "Don't have an account? ",
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: const TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignUpScreen()),
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
