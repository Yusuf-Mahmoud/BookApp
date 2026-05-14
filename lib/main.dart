import 'package:flutter/material.dart';

import 'src/core/app_theme.dart';
import 'src/presentation/pages/main_screen_page.dart';

void main() => runApp(MaterialApp(
      home: MainScreenPage(),
      debugShowCheckedModeBanner: false,
      theme: appTheme,
    ));
