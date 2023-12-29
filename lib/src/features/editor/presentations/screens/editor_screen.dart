// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:docsync/src/features/home/presentation/provider/document_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:docsync/src/config/themes/themes.dart';
import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/features/editor/domain/entities/docs.dart';
import 'package:docsync/src/features/editor/presentations/provider/docs_provider.dart';

class EditorScreen extends ConsumerStatefulWidget {
  final String id;
  final String title;
  const EditorScreen({super.key, required this.id, required this.title});

  @override
  ConsumerState<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends ConsumerState<EditorScreen> {
  final titleInput = TextEditingController();
  quill.QuillController controller = quill.QuillController.basic();

  @override
  void initState() {
    super.initState();
    titleInput.text = widget.title;
    // ignore: unused_result
    ref.refresh(getDocByIdProvider(widget.id));
  }

  @override
  void dispose() {
    titleInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    return Scaffold(
      backgroundColor: colorFromHex('fafbfc'),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: Container(
            width: width,
            height: 500,
            color: Colors.white,
            child: SafeArea(
              child: Row(
                children: [
                  Consumer(builder: (context, ref, child) {
                    return IconButton(
                      onPressed: () {
                        ref.invalidate(getDocumentsProvider);
                        context.pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.grey),
                    );
                  }),
                  const Gap(10),
                  GestureDetector(
                    onTap: () => {context.pop()},
                    child: Assets.images.folders.image(height: 30),
                  ),
                  const Gap(5),
                  IntrinsicWidth(
                    child: Consumer(builder: (context, ref, child) {
                      return TextField(
                        controller: titleInput,
                        onChanged: (v) =>
                            titleInput.text = titleInput.text.trim(),
                        onSubmitted: (v) async {
                          final res = await ref
                              .read(updateDocTitleUseCaseProvider)
                              .call(
                                UpdateDocsTitleReq(
                                    id: widget.id, title: titleInput.text),
                              );
                          if (res is DataSuccess &&
                              res.data?.statusCode == HttpStatus.ok) {
                            titleInput.text = v;
                          }
                        },
                        style: Poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700,
                        ),
                        decoration: const InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      );
                    }),
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    icon: Icon(PhosphorIcons.lockKey(PhosphorIconsStyle.fill)),
                    label: const Text('Share'),
                  ),
                  const Gap(10),
                ],
              ),
            )),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            height: 0.5,
            width: double.infinity,
          ),
          const Gap(10),
          quill.QuillToolbar.simple(
            configurations: quill.QuillSimpleToolbarConfigurations(
              showDividers: true,
              controller: controller,
            ),
          ),
          const Gap(10),
          Container(
            color: Colors.grey,
            height: 0.5,
            width: double.infinity,
          ),
          const Gap(20),
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final doc = ref.watch(getDocByIdProvider(widget.id));
                return doc.when(
                  data: (data) {
                    return SizedBox(
                      width: 750,
                      child: Card(
                        elevation: 5,
                        color: Colors.white,
                        child: Container(
                          color: Colors.white,
                          child: quill.QuillEditor.basic(
                            configurations: quill.QuillEditorConfigurations(
                              padding: const EdgeInsets.all(30),
                              controller: controller,
                              readOnly: false,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  error: (e, s) {
                    return Center(
                      child: Text(e.toString()),
                    );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
