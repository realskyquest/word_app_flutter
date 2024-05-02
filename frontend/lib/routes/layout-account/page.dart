import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:word_app/utils/check_server.dart';
import 'package:word_app/utils/logger.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/pocketbase_provider.dart';
import 'package:word_app/provider/theme_provider.dart';
import 'package:word_app/provider/saves_provider.dart';
import 'package:word_app/provider/account_provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('AccountPage Class');

    return Consumer2<ThemeProvider, PocketbaseProvider>(
      builder: (BuildContext context, ThemeProvider themeProvider,
          PocketbaseProvider pocketbaseProvider, Widget? child) {
        logger.i('AccountPage Consumer');

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
                      title: Text('App debug info'),
                      subtitle: Text('Simple debug information about app'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      color: themeProvider.appDarkMode == true
                          ? appColors.onPrimaryContainer
                          : appColors.primaryContainer,
                      child: _userInfoPanel(),
                    ),
                  ],
                ),
              ),
              const Gap(10),
              // Panel
              Card(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: <Widget>[
                    const ListTile(
                      title: Text('Account panel'),
                      subtitle: Text('Handle your account affairs here'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      color: themeProvider.appDarkMode == true
                          ? appColors.onPrimaryContainer
                          : appColors.primaryContainer,
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Sync with PocketBase'),
                                const Gap(5),
                                _SwitchButton(),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                GoRouter.of(context).push('/signup');
                              },
                              child: const Text('Sign up'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
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
      'Account',
    ),
  );
}

Widget _userInfoPanel() {
  return Container(
    margin: const EdgeInsets.only(left: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Get the current display mode
        FutureBuilder(
          future: FlutterDisplayMode.active,
          builder: (BuildContext context, AsyncSnapshot<DisplayMode> snapshot) {
            if (snapshot.hasData) {
              return Text('Display mode: ${snapshot.data.toString()}');
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const LinearProgressIndicator();
          },
        ),
        const Gap(10),
        // Get the path to the location of the Hive database.
        FutureBuilder(
          future: getApplicationDocumentsDirectory(),
          builder: (BuildContext context, AsyncSnapshot<Directory> snapshot) {
            if (snapshot.hasData) {
              return Text('Hive path: \n "${snapshot.data!.path}/hive"');
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const LinearProgressIndicator();
          },
        ),
        const Gap(10),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Server status:'),
              const Gap(5),
              // Get the current server status
              ChangeNotifierProvider(
                create: (context) => _ServerStatusWidgetProvider(),
                builder: (context, child) {
                  _initialFutureServerStatus = _fetchServerStatus();
                  return _ServerStatusWidget();
                },
              ),
            ],
          ),
        ),
        const Gap(10),
      ],
    ),
  );
}

// Switch button here

class _SwitchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    logger.t('Built SwitchButton');

    return Switch(
      value: context.watch<AccountProvider>().switchValue,
      onChanged: (value) {
        context.read<AccountProvider>().changeSwitchValue(value);
      },
    );
  }
}

// Check server down here

Future<bool> _fetchServerStatus() async {
  return await isServerRunningUtil();
}

late Future<bool> _initialFutureServerStatus;

class _ServerStatusWidgetProvider with ChangeNotifier, DiagnosticableTreeMixin {
  Future<bool> _futureServerStatus = _initialFutureServerStatus;

  Future<bool> get futureServerStatus => _futureServerStatus;

  void changeFutureServerStatus(Future<bool> value) {
    _futureServerStatus = value;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Future<bool>>(
        'futureServerStatus', futureServerStatus));
  }
}

class _ServerStatusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    logger.d('Building status widget');

    return FutureBuilder(
      future: context.watch<_ServerStatusWidgetProvider>().futureServerStatus,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == true) {
            return const Text('Server has been found');
          } else {
            return const Text('Server has not been found');
          }
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
