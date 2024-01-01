import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:docsync/src/config/themes/themes.dart';
import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/features/common/presentation/providers/user_data_provider.dart';

Future<void> showProfileDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(content: _ProfileDialogWidget());
    },
  );
}

class _ProfileDialogWidget extends ConsumerStatefulWidget {
  const _ProfileDialogWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileDialogWidgetState();
}

class _ProfileDialogWidgetState extends ConsumerState<_ProfileDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => context.pop(),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 400,
          maxHeight: 300,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final userData = ref.watch(userInfoProvider);
                return userData.maybeWhen(
                  data: (d) {
                    return Column(
                      children: [
                        ClipOval(
                          child: GestureDetector(
                            onTap: () => showProfileDialog(context),
                            child: CircleAvatar(
                              radius: 40,
                              child: Image.network(
                                d.avatar,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const SizedBox(),
                              ),
                            ),
                          ),
                        ),
                        const Gap(20),
                        ListTile(
                          title: Text(
                            'Email',
                            style: Poppins(fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            d.email,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Username',
                            style: Poppins(fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(d.username),
                        ),
                        const Gap(10),
                      ],
                    );
                  },
                  orElse: () => const CircleAvatar(),
                );
              },
            ),

            // CustomTextField(
            //   controller: TextEditingController(),
            //   hint: 'Username',
            // ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                minimumSize: const Size.fromHeight(50),
                backgroundColor: colorFromHex('0065ff'),
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
