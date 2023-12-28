import 'package:docsync/src/config/themes/themes.dart';
import 'package:docsync/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  quill.QuillController controller = quill.QuillController.basic();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFromHex('fafbfc'),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: Container(
            height: 500,
            color: Colors.white,
            child: Row(
              children: [
                const Gap(10),
                Assets.images.folders.image(height: 30),
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
          const Gap(20),
          Expanded(
            child: SizedBox(
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
            ),
          )
        ],
      ),
    );
  }
}
