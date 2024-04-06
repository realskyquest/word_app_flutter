import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:word_app/provider/theme_provider.dart';
import 'package:word_app/provider/saved_page_provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors =
        context.watch<ThemeProvider>().appTheme.colorScheme;
    
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: appColors.onTertiaryContainer),
        backgroundColor: appColors.tertiaryContainer,
        title: Text(style: TextStyle(color: appColors.onTertiaryContainer), 'Account'),
      ),
      body: const Center(
        child: Text('Coming soon'),
      ),
    );
  }
}

class AccountPanel extends StatelessWidget {
  const AccountPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
