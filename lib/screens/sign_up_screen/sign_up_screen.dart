import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/signin_Signup_Reusable_widget.dart';
import '../login_screen/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final FormGroup signUpScreen = FormGroup({
    'firstName': FormControl<String>(validators: [Validators.required]),
    'lastName': FormControl<String>(validators: [Validators.required]),
    'email': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(
        validators: [Validators.required, Validators.minLength(6)]),
    'confirmPassword': FormControl<String>(
        validators: [Validators.required, Validators.minLength(6)]),
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ReactiveForm(
        formGroup: signUpScreen,
        child: Scaffold(
          //backgroundColor: const Color(0xff007BFF),
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
                      Column(
                        children: [
                          ReactiveTextField(
                            formControlName: 'firstName',
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(14),
                              hintText: 'FirstName',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          ReactiveTextField(
                            formControlName: 'lastName',
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(14),
                              hintText: 'LastName',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          ReactiveTextField(
                            formControlName: 'email',
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(14),
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
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
                          const SizedBox(height: 16),
                          ReactiveTextField(
                            formControlName: 'confirmPassword',
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(14),
                              hintText: 'ConfirmPassword',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          ReusableButton(
                            text: 'SignUp',
                            color: const Color(0xff10244B),
                            onPressed: () {},
                          ),
                          const SizedBox(height: 32),
                          Text.rich(
                            TextSpan(
                              text: "Already have an account? ",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Login',
                                  style: const TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigate to SignUpScreen when "Sign Up" is clicked
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()),
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
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
