// ignore_for_file: use_build_context_synchronously, unused_result

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill/quill_delta.dart' as delta;
import 'package:flutter_quill_extensions/flutter_quill_embeds.dart' as ext;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:docsync/src/config/config.dart';
import 'package:docsync/src/config/themes/themes.dart';
import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/features/editor/domain/entities/docs.dart';
import 'package:docsync/src/features/editor/presentations/provider/docs_provider.dart';
import 'package:docsync/src/features/editor/presentations/provider/socket_provider.dart';
import 'package:docsync/src/features/home/presentation/provider/document_provider.dart';

class EditorScreen extends ConsumerStatefulWidget {
  final String id;
  const EditorScreen({super.key, required this.id});

  @override
  ConsumerState<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends ConsumerState<EditorScreen> {
  final titleInput = TextEditingController(text: 'Untitled Document');
  quill.QuillController? _controller;

  //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  Docs? data;

  @override
  void initState() {
    final socketRepository = ref.read(socketRepositoryProvider);
    super.initState();
    socketRepository.joinRoom(widget.id);
    fetchDocumentData();

    ref.read(socketClientProvider).on('changes', (dd) {
      final json = jsonEncode(dd);
      final map = jsonDecode(json) as Map<String, dynamic>;
      final input = map['delta'] as List<dynamic>;
      logger.d(input);
      voidChange(input);
    });

    Timer.periodic(const Duration(seconds: 2), (timer) {
      socketRepository.autoSave(<String, dynamic>{
        'delta': _controller?.document.toDelta(),
        'room': widget.id,
      });
    });
  }

  voidChange(List<dynamic> input) {
    _controller?.compose(
      delta.Delta.fromJson(input),
      _controller?.selection ?? const TextSelection.collapsed(offset: 0),
      quill.ChangeSource.remote,
    );
  }

  Future<void> fetchDocumentData() async {
    final socketRepository = ref.read(socketRepositoryProvider);
    try {
      data = (await ref.read(getDocByIdUseCaseProvider).call(widget.id))
          .data
          ?.data;

      if (data != null) {
        titleInput.text = data!.title;
      }
    } catch (_) {
    } finally {
      setState(() {});
      _controller = quill.QuillController(
        document: data?.content == null || (data?.content.isEmpty ?? true)
            ? quill.Document()
            : quill.Document.fromDelta(
                delta.Delta.fromJson(data!.content),
              ),
        selection: const TextSelection.collapsed(offset: 0),
      );

      _controller!.document.changes.listen((event) {
        if (event.source == quill.ChangeSource.local) {
          Map<String, dynamic> map = {
            'delta': event.change,
            'room': widget.id,
          };
          socketRepository.typing(map);
        }
      });
    }
  }

  @override
  void dispose() {
    titleInput.dispose();
    super.dispose();
  }

  void printD() async {
    final d = _controller?.document.toDelta();
    logger.d(d);
    _controller = quill.QuillController(
      document: quill.Document(),
      selection: const TextSelection.collapsed(offset: 0),
    );
    await Future.delayed(const Duration(seconds: 3));
    _controller = quill.QuillController(
      document: quill.Document.fromDelta(d!),
      selection: const TextSelection.collapsed(offset: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    if (_controller == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Visibility(
        visible: _controller != null,
        replacement: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        child: Scaffold(
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
                        onDoubleTap: printD,
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
                        icon: const SizedBox(),
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
                  controller: _controller!,
                  embedButtons: ext.FlutterQuillEmbeds.toolbarButtons(),
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
                child: SizedBox(
                  child: Card(
                    elevation: 5,
                    child: Container(
                      width: 750,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                          )
                        ],
                      ),
                      child: quill.QuillEditor.basic(
                        configurations: quill.QuillEditorConfigurations(
                          padding: const EdgeInsets.all(30),
                          controller: _controller!,
                          readOnly: false,
                          embedBuilders: kIsWeb
                              ? ext.FlutterQuillEmbeds.editorWebBuilders()
                              : ext.FlutterQuillEmbeds.editorBuilders(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
