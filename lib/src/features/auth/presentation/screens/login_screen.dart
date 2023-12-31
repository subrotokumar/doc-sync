// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:docsync/src/config/themes/themes.dart';
import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/core/utils/secure_storage.dart';
import 'package:docsync/src/features/auth/domain/entities/auth_user_req.dart';
import 'package:docsync/src/features/auth/presentation/provider/user_provider.dart';
import 'package:docsync/src/features/common/presentation/providers/provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailInput = TextEditingController();
  final passwordInput = TextEditingController();
  final usernameInput = TextEditingController();
  bool showPassword = false;
  bool login = true;

  bool validate() {
    if (emailInput.text.isEmpty || passwordInput.text.isEmpty) {
      context.showToast(
        title: 'Email or password field is empty',
        type: ToastType.error,
      );
      return false;
    }
    if (!emailInput.text.contains('@') &&
        !login &&
        emailInput.text.endsWith('.com')) {
      context.showToast(
        title: 'Invalid Email',
        type: ToastType.error,
      );
      return false;
    }
    return true;
  }

  Future<void> loginUser() async {
    if (!validate()) return;
    final isEmail =
        emailInput.text.contains('@') && emailInput.text.endsWith('.com');
    final response = await ref.read(loginUseCaseProvider).call(
          AuthUserReq(
            password: passwordInput.text,
            email: isEmail ? emailInput.text : null,
            username: isEmail ? null : emailInput.text,
          ),
        );
    if (response is DataSuccess) {
      final res = response.data;
      if (res == null) return;
      if (!res.success) {
        context.showToast(
          title: res.message,
          type: ToastType.warning,
        );
        return;
      }
      context.showToast(
        title: res.message,
      );
      await SecureStorage.setRefreshToken(res.data?.refreshToken ?? '');
      ref.read(accessTokenProvider.notifier).update =
          res.data?.accessToken ?? '';

      context.push('/home');
    } else {
      context.showToast(
        title: response.error?.message ?? 'Something went wrong',
        type: ToastType.error,
      );
    }
  }

  Future<void> registerUser() async {
    if (!validate()) return;
    final response = await ref.read(registerUseCaseProvider).call(
          AuthUserReq(
            password: passwordInput.text,
            email: emailInput.text,
            username: usernameInput.text,
          ),
        );
    if (response is DataSuccess) {
      final res = response.data;
      if (res == null) return;
      if (!res.success) {
        context.showToast(
          title: res.message,
          type: ToastType.warning,
        );
        return;
      }
      context.showToast(
        title: 'Account Created',
      );
    } else {
      context.showToast(
        title: response.error?.message ?? 'Something went wrong',
        type: ToastType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = context.mediaQueryData;
    return Scaffold(
      backgroundColor: colorFromHex('fafbfc'),
      body: LayoutBuilder(
        builder: (context, boxConstraints) {
          final visible = boxConstraints.maxWidth > 800;
          return SingleChildScrollView(
            child: Container(
              height: mq.size.height,
              width: mq.size.width,
              padding: const EdgeInsets.all(10).copyWith(bottom: 0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Visibility(
                      visible: visible,
                      child: Assets.gifs.juicyTeamDiscussingTheProject.image(
                        height: 300,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Visibility(
                      visible: visible,
                      child: Assets.gifs
                          .juicyGirlAndGuyPreparingStartUpRocketToLaunchWithIdeas
                          .image(
                        height: 260,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      constraints: const BoxConstraints(
                        maxWidth: 400,
                        minHeight: 400,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.images.folders.image(height: 24),
                              const Gap(8),
                              Text(
                                'Docsync',
                                style: Poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ],
                          ),
                          const Gap(30),
                          CustomTextField(
                            controller: emailInput,
                            hint: login ? 'Email or Username' : 'Email',
                          ),
                          Visibility(
                            visible: !login,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Gap(16),
                                CustomTextField(
                                  controller: usernameInput,
                                  hint: 'Username',
                                  onChange: (v) {
                                    usernameInput.text =
                                        usernameInput.text.toLowerCase().trim();
                                  },
                                ),
                              ],
                            ).animate().fadeIn(),
                          ),
                          const Gap(16),
                          CustomTextField(
                            controller: passwordInput,
                            hint: 'Password',
                            isPassword: true,
                          ),
                          const Gap(16),
                          Consumer(builder: (context, ref, child) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorFromHex('0065ff'),
                                foregroundColor: Colors.white,
                                minimumSize: const Size.fromHeight(55),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              onPressed: () async {
                                login ? loginUser() : registerUser();
                              },
                              child: Text(login ? 'Continue' : 'Register'),
                            );
                          }),
                          const Gap(20),
                          Text(
                            'Or continue with',
                            style: Poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          const Gap(10),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.black,
                              minimumSize: const Size.fromHeight(55),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                                side: const BorderSide(
                                  width: 0.5,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Assets.images.google.image(height: 20),
                                const Gap(10),
                                Text(
                                  'Google',
                                  style: Poppins(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Gap(20),
                          TextButton(
                            onPressed: () => setState(() {
                              login = !login;
                            }),
                            child: Text(
                              'Create a account',
                              style: Poppins(
                                color: Colors.indigo,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const Divider(),
                          Text(
                            'Privacy • Github',
                            style: Poppins(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.isPassword = false,
    this.onSubmit,
    this.onChange,
  });

  final TextEditingController controller;
  final String hint;
  final bool isPassword;
  final Function(String value)? onSubmit;
  final Function(String value)? onChange;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPass = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,
      onSubmitted: widget.onSubmit,
      onChanged: widget.onChange,
      obscureText: widget.isPassword,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        focusColor: colorFromHex('ebecf0'),
        hoverColor: colorFromHex('ebecf0'),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () => setState(() {
                  showPass = !showPass;
                }),
                icon: Icon(
                  !showPass
                      ? PhosphorIconsBold.eyeSlash
                      : PhosphorIconsBold.eye,
                  color: Colors.black26,
                ),
              )
            : null,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        hintText: widget.hint,
        hintStyle: Poppins(
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        labelText: widget.hint,
      ),
    );
  }
}
