// ignore_for_file: use_build_context_synchronously

import 'package:docsync/src/features/home/presentation/widget/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:docsync/src/config/config.dart';
import 'package:docsync/src/config/themes/themes.dart';
import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/features/common/presentation/providers/user_data_provider.dart';
import 'package:docsync/src/features/common/presentation/widgets/custom_textfield.dart';
import 'package:docsync/src/features/home/presentation/provider/document_provider.dart';
import 'package:docsync/src/features/home/presentation/widget/docs_icon.dart';
import 'package:docsync/src/features/home/presentation/widget/profile_dialog.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    final mq = context.mediaQueryData;
    return LayoutBuilder(builder: (context, constraints) {
      final visible = constraints.maxWidth > 500;
      return Scaffold(
        bottomNavigationBar: visible
            ? null
            : SizedBox(
                height: 50,
                width: mq.size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomIconButton(
                      icon:
                          PhosphorIcons.arrowClockwise(PhosphorIconsStyle.bold),
                      onTap: () async {
                        ref.invalidate(userInfoProvider);
                        ref.invalidate(getDocumentsProvider);
                      },
                    ),
                    CustomIconButton(
                      icon: PhosphorIcons.plus(PhosphorIconsStyle.bold),
                      onTap: () async {
                        await ref.read(createDocumentUserCaseProvider).call();
                        ref.invalidate(getDocumentsProvider);
                      },
                    ),
                    CustomIconButton(
                      icon: PhosphorIcons.sortAscending(
                        PhosphorIconsStyle.bold,
                      ),
                      onTap: () {},
                    ),
                    CustomIconButton(
                      icon: PhosphorIcons.user(
                        PhosphorIconsStyle.bold,
                      ),
                      onTap: () {
                        showProfileDialog(context);
                      },
                    ),
                  ],
                ),
              ),
        body: Row(
          children: [
            Visibility(
              visible: visible,
              replacement: const SizedBox(),
              child: NavigationRail(
                selectedIndex: selected,
                onDestinationSelected: (value) async {
                  if (value != 2) return;
                  setState(() => selected = 2);
                  await showProfileDialog(context);
                  setState(() => selected = 1);
                },
                destinations: [
                  NavigationRailDestination(
                    disabled: true,
                    icon: GestureDetector(
                      onTap: () async => await Future.wait([
                        ref.refresh(userInfoProvider.future),
                        ref.refresh(getDocumentsProvider.future),
                      ]),
                      child: Assets.images.folders.image(height: 30),
                    ),
                    label: const Text('data'),
                  ),
                  const NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  const NavigationRailDestination(
                    icon: Icon(Icons.person),
                    label: Text('Profile'),
                  ),
                ],
              ),
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  ref.read(userInfoProvider.future);
                  ref.read(getDocumentsProvider.future);
                },
                child: Consumer(builder: (context, ref, child) {
                  final docsList = ref.watch(getDocumentsProvider);
                  return docsList.maybeWhen(orElse: () {
                    logger.w('Not Document found');
                    return const SizedBox();
                  }, data: (data) {
                    return Column(
                      children: [
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              SafeArea(
                                child: Container(
                                  height: 55,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10)
                                          .copyWith(top: 10),
                                  color: Colors.white,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Gap(8),
                                      Text(
                                        'Docsync',
                                        style: Poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                      const Spacer(),
                                      const Gap(10),
                                      Consumer(builder: (context, ref, child) {
                                        final userData =
                                            ref.watch(userInfoProvider);
                                        return userData.maybeWhen(
                                          data: (d) {
                                            return Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                if (visible)
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        d.username,
                                                        style: Poppins(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        d.email,
                                                        style: Poppins(
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                const Gap(10),
                                                ClipOval(
                                                  child: GestureDetector(
                                                    onTap: () =>
                                                        showProfileDialog(
                                                            context),
                                                    child: CircleAvatar(
                                                      radius: 18,
                                                      child: Image.network(
                                                        d.avatar,
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            const SizedBox(),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                              const Divider(),
                              const Gap(10),
                              Row(
                                children: [
                                  const Gap(10),
                                  SizedBox(
                                    width: visible ? 300 : mq.size.width - 30,
                                    child: Center(
                                      child: SizedBox(
                                        height: 40,
                                        child: CustomTextField(
                                          borderColor: Colors.transparent,
                                          filledColor: Colors.grey.shade200,
                                          controller: TextEditingController(),
                                          hint: 'Join Code',
                                          radius: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  if (visible)
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomIconButton(
                                          icon: PhosphorIcons.arrowClockwise(
                                              PhosphorIconsStyle.bold),
                                          onTap: () async {
                                            ref.invalidate(userInfoProvider);
                                            ref.invalidate(
                                                getDocumentsProvider);
                                          },
                                        ),
                                        const Gap(10),
                                        CustomIconButton(
                                          icon: PhosphorIcons.plus(
                                              PhosphorIconsStyle.bold),
                                          onTap: () async {
                                            await ref
                                                .read(
                                                    createDocumentUserCaseProvider)
                                                .call();
                                            ref.invalidate(
                                                getDocumentsProvider);
                                          },
                                        ),
                                        const Gap(10),
                                        CustomIconButton(
                                          icon: PhosphorIcons.sortAscending(
                                            PhosphorIconsStyle.bold,
                                          ),
                                          onTap: () {},
                                        ),
                                      ],
                                    ),
                                  const Gap(10),
                                ],
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return PopupMenuButton(
                                  enableFeedback: false,
                                  tooltip: '',
                                  color: Colors.white,
                                  itemBuilder: (context) {
                                    return [
                                      PopupMenuItem(
                                        onTap: () {
                                          context.push(
                                              '/editor/${data[index].id}');
                                        },
                                        child: const Text('Open'),
                                      ),
                                      const PopupMenuItem(
                                        value: 'Delete',
                                        child: Text('Rename'),
                                      ),
                                      PopupMenuItem(
                                        onTap: () async {
                                          try {
                                            await ref
                                                .read(
                                                    deleteDocumentUseCaseProvider)
                                                .call(data[index].id);
                                            context.showToast(
                                              title: 'Deleted Successfull',
                                              type: ToastType.info,
                                            );
                                          } catch (_) {}
                                          ref.invalidate(getDocumentsProvider);
                                        },
                                        child: const Text('Delete'),
                                      ),
                                    ];
                                  },
                                  child: Card(
                                    elevation: 0,
                                    color: Colors.blue.shade50,
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      leading: const DocsIcon(),
                                      contentPadding: const EdgeInsets.only(
                                          left: 16, right: 16),
                                      title: Text(
                                        data[index].title,
                                        style: Poppins(),
                                      ),
                                      trailing: Text(
                                        data[index]
                                            .updatedAt
                                            .toLocal()
                                            .toString()
                                            .split(' ')
                                            .first,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const Gap(10),
                              itemCount: data.length,
                            ),
                          ),
                        ),
                      ],
                    );
                  });
                }),
              ),
            ),
          ],
        ),
      );
    });
  }
}
