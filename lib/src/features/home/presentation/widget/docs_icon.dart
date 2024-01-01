import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DocsIcon extends StatelessWidget {
  const DocsIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: Stack(
        children: [
          Icon(
            PhosphorIcons.file(PhosphorIconsStyle.fill),
            color: Colors.blue,
            size: 30,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'D',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
