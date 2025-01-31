import 'package:carrental/application/presentation/screens/auth/auth_bloc/bloc/auth_bloc.dart';
import 'package:carrental/application/presentation/screens/auth/widgets/customtextformfield.dart';
import 'package:carrental/domain/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authblocc = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthLoading) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.orange,
          ),
        );
      }

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
                      child: Icon(
                        Icons.person,
                        size: 80,
                        color: kwhite,
                      ),
                    ),
                    Text("Login ",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: kwhite)),
                    const SizedBox(
                      height: 120,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        hintText: "Enter Email"),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        hintText: "Enter Password"),
                    const SizedBox(
                      height: 60,
                    ),
                    InkResponse(
                      onTap: () {
                        authblocc.add(LoginEvent(
                            password: _passwordController.text.trim(),
                            email: _emailController.text.trim()));
                      },
                      child: Container(
                        height: 52,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.orange),
                        child: Center(
                          child: Text(
                            "Login",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("New here?",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: kwhite)),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: Text("Register",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: kwhite)))
                      ],
                    )
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
