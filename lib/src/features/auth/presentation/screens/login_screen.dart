// ignore_for_file: use_build_context_synchronously

import 'package:docsync/src/config/config.dart';
import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/core/utils/secure_storage.dart';
import 'package:docsync/src/features/auth/domain/entities/auth_user_req.dart';
import 'package:docsync/src/features/auth/presentation/provider/user_provider.dart';
import 'package:docsync/src/features/common/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:docsync/src/config/themes/themes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailInput = TextEditingController();
  final passwordInput = TextEditingController();
  final usernameInput = TextEditingController();
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFromHex('fafbfc'),
      body: LayoutBuilder(builder: (context, boxConstraints) {
        final visible = boxConstraints.maxWidth > 800;
        return Container(
          padding: const EdgeInsets.all(10),
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
                      TextField(
                        controller: emailInput,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: colorFromHex('ebecf0'),
                          hoverColor: colorFromHex('ebecf0'),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: 'Enter your email',
                          hintStyle: Poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const Gap(16),
                      TextField(
                        controller: passwordInput,
                        keyboardType: TextInputType.text,
                        obscureText: showPassword,
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: colorFromHex('ebecf0'),
                          hoverColor: colorFromHex('ebecf0'),
                          suffixIcon: IconButton(
                            onPressed: () => setState(() {
                              showPassword = !showPassword;
                            }),
                            icon: Icon(
                              !showPassword
                                  ? PhosphorIconsBold.eyeSlash
                                  : PhosphorIconsBold.eye,
                              color: Colors.black26,
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: 'Password',
                          hintStyle: Poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
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
                            if (emailInput.text.isEmpty ||
                                passwordInput.text.isEmpty) {
                              context.showToast(
                                title: 'Email or password field is empty',
                                type: ToastType.error,
                              );
                              return;
                            }
                            final response =
                                await ref.read(loginUseCaseProvider).call(
                                      AuthUserReq(
                                        username: 'ss',
                                        password: passwordInput.text,
                                        email: emailInput.text,
                                      ),
                                    );
                            if (response is DataSuccess &&
                                response.data != null) {
                              final res = response.data;
                              if (res == null) return;
                              logger.d(res);
                              context.showToast(
                                title: res.message,
                              );
                              await SecureStorage.setRefreshToken(
                                  res.data?.refreshToken ?? '');
                              ref.read(accessTokenProvider.notifier).update =
                                  res.data?.accessToken ?? '';

                              context.push('/editor');
                            } else {
                              context.showToast(
                                title: response.data?.message ??
                                    'Something went wrong',
                                type: ToastType.error,
                              );
                            }
                          },
                          child: const Text('Continue'),
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
                        onPressed: () {},
                        child: Text(
                          'Create a account',
                          style: Poppins(color: Colors.indigo, fontSize: 12),
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
        );
      }),
    );
  }
}
