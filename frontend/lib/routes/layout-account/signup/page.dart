import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import 'package:word_app/utils/logger.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/pocketbase_provider.dart';
import 'package:word_app/provider/theme_provider.dart';

//import 'package:flutter_form_builder/flutter_form_builder.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => SignupForm();
}

class SignupForm extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

   @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please fill this field';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please fill this field';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // The form is valid
              } else {
                // The form has some validation errors.
                // Do Something...
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('SignupPage Class');

    return Consumer2<ThemeProvider, PocketbaseProvider>(
      builder: (BuildContext context, ThemeProvider themeProvider,
          PocketbaseProvider pocketbaseProvider, Widget? child) {
        logger.i('SignupPage Consumer');

        final ColorScheme appColors = themeProvider.appTheme.colorScheme;

        return Scaffold(
          appBar: _rootAppBar(context, themeProvider),
          body: Column(
            children: [
              Card(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  children: <Widget>[
                    const ListTile(
                      title: Text('Sign up panel'),
                      subtitle: Text('Make a new account'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      color: themeProvider.appDarkMode == true
                          ? appColors.onPrimaryContainer
                          : appColors.primaryContainer,
                      child: const Signup(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

AppBar _rootAppBar(BuildContext context, ThemeProvider themeProvider) {
  final ColorScheme appColors = themeProvider.appTheme.colorScheme;

  return AppBar(
    iconTheme: IconThemeData(color: appColors.onTertiaryContainer),
    backgroundColor: appColors.secondaryContainer,
    title: Text(
      style: TextStyle(
        color: appColors.onSecondaryContainer,
      ),
      'Sign up',
    ),
  );
}
