import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:docsync/src/config/config.dart';
import 'package:docsync/src/config/themes/themes.dart';
import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/features/common/presentation/providers/user_data_provider.dart';
import 'package:docsync/src/features/home/presentation/provider/document_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.wait([
          ref.read(userInfoProvider.future),
          ref.read(getDocumentsProvider.future),
        ]);
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: Card(
            elevation: 2,
            margin: const EdgeInsets.all(0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 500,
              color: Colors.white,
              child: Row(
                children: [
                  const Gap(10),
                  GestureDetector(
                    onTap: () async => await Future.wait([
                      ref.read(userInfoProvider.future),
                      ref.read(getDocumentsProvider.future),
                    ]),
                    child: Assets.images.folders.image(height: 30),
                  ),
                  const Gap(12),
                  Text(
                    'Docsync',
                    style: Poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const Spacer(),
                  ClipOval(
                    child: GestureDetector(
                      onTap: () async {
                        await ref.read(createDocumentUserCaseProvider).call();
                        await ref.read(getDocumentsProvider.future);
                      },
                      child: const CircleAvatar(
                        child: Icon(Icons.add),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Consumer(builder: (context, ref, child) {
                    final userData = ref.read(userInfoProvider);
                    return userData.maybeWhen(
                      data: (d) {
                        return ClipOval(
                          child: CircleAvatar(
                            radius: 18,
                            child: Image.network(
                              d.avatar,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const SizedBox(),
                            ),
                          ),
                        );
                      },
                      orElse: () => const CircleAvatar(),
                    );
                  }),
                  const Gap(10),
                ],
              ),
            ),
          ),
        ),
        body: Consumer(builder: (context, ref, child) {
          final docsList = ref.read(getDocumentsProvider);
          return docsList.maybeWhen(orElse: () {
            logger.w('Not Document found');
            return const SizedBox();
          }, data: (data) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => context.push('/editor/${data[index].id}'),
                  title: Text(data[index].title),
                  subtitle: Text(data[index].updatedAt.toString()),
                  trailing: Icon(PhosphorIcons.dotsThreeOutlineVertical()),
                );
              },
              separatorBuilder: (context, index) => const Gap(6),
              itemCount: data.length,
            );
          });
        }),
      ),
    );
  }
}
