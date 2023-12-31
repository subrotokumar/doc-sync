// ignore_for_file: use_build_context_synchronously

import 'package:docsync/src/config/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/core/utils/secure_storage.dart';
import 'package:docsync/src/features/auth/domain/entities/refresh_token_req.dart';
import 'package:docsync/src/features/auth/presentation/provider/user_provider.dart';
import 'package:docsync/src/features/common/presentation/providers/provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    try {
      final refreshToken = await SecureStorage.getRefreshToken;
      if (refreshToken == null) return context.go("/login");
      final res = await ref
          .read(refreshTokenUseCaseProvider)
          .call(RefreshTokenReq(refresh: refreshToken));
      if (res is DataSuccess && res.data != null) {
        if (!res.data!.success) return;
        final accessToken = res.data?.data?.accessToken;
        final refreshToken = res.data?.data?.refreshToken;
        if (accessToken == null || refreshToken == null) return;
        ref.read(accessTokenProvider.notifier).update = accessToken;
        await SecureStorage.setRefreshToken(refreshToken);
        await Future.delayed(1.seconds);
        return context.go("/home");
      }
    } catch (_) {
      await Future.delayed(1.seconds);
      return context.go("/login");
    }
    await Future.delayed(1.seconds);
    context.go("/login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 250,
          height: 260,
          child: Stack(
            children: [
              Assets.lotties.splash.lottie(
                width: 250,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Docsync',
                  style: Poppins(
                    fontWeight: FontWeight.bold,
                    color: colorFromHex('9abbe9'),
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
