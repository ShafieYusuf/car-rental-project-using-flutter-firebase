import 'package:carrental/application/presentation/screens/auth/model/usermodel.dart';
import 'package:carrental/application/presentation/screens/auth/widgets/customtextformfield.dart';
import 'package:carrental/domain/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

import '../auth_bloc/bloc/auth_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authbloc = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Authenticated) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        });
      }

      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/login.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const WidgetCircularAnimator(
                      outerColor: Colors.orange,
                      innerColor: Colors.orange,
                      size: 130,
                      child: Icon(Icons.person_add, size: 80, color: kwhite),
                    ),
                    Text(
                      "Register",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: kwhite),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      hintText: "Enter Email",
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      hintText: "Enter Password",
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: _nameController,
                      hintText: "Enter Name",
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      keyboardType: TextInputType.number,
                      controller: _phoneController,
                      hintText: "Enter Phone",
                    ),
                    const SizedBox(height: 40),
                    InkResponse(
                      onTap: () {
                        Usermodel user = Usermodel(
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                          phone: _phoneController.text,
                        );
                        authbloc.add(SignupEvent(user: user));
                      },
                      child: Container(
                        height: 52,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.orange,
                        ),
                        child: Center(
                          child: Text(
                            "Register",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an Account?",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: kwhite),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Login",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: kwhite),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
