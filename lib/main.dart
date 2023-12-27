import 'package:device_preview/device_preview.dart';
import 'package:docsync/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(desktop: 500, tablet: 400, watch: 200),
  );
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) {
        return const ProviderScope(child: MyApp());
      },
    ),
  );
}
