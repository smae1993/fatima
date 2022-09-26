import 'package:example/views/pages/getting_start/installation_page.dart';
import 'package:example/views/pages/getting_start/usage_page.dart';
import 'package:example/views/pages/navigation/fatima_dialog_page.dart';
import 'package:example/views/pages/navigation/fatima_page_page.dart';
import 'package:example/views/pages/navigation/fatima_snackbar_page.dart';
import 'package:example/views/pages/navigation/routing_system_page.dart';
import 'package:example/views/pages/over_view_page.dart';
import 'package:example/views/pages/state_management/controller_page.dart';
import 'package:example/views/pages/state_management/mvc_page.dart';
import 'package:example/views/pages/state_management/updater_page.dart';
import 'package:fatima/fatima.dart';

List<FatimaPage> routes = [
  //------------------------------------------------------------------- overview
  FatimaPage(
    name: '/',
    page: () => const OverViewPage(),
  ),
  //-------------------------------------------------------------- getting start
  FatimaPage(
    name: '/installation',
    page: () => const InstallationPage(),
  ),
  FatimaPage(
    name: '/usage',
    page: () => const UsagePage(),
  ),
  //----------------------------------------------------------------- navigation
  FatimaPage(
    name: '/routing_system',
    page: () => const RoutingSystemPage(),
  ),
  FatimaPage(
    name: '/page',
    page: () => const FatimaPagePage(),
  ),
  FatimaPage(
    name: '/dialog',
    page: () => const FatimaDialogPage(),
  ),
  FatimaPage(
    name: '/snackbar',
    page: () => const FatimaSnackbarPage(),
  ),
  //------------------------------------------------------------state management
  FatimaPage(
    name: '/mvc',
    page: () => const MVCPage(),
  ),
  FatimaPage(
    name: '/controller',
    page: () => const ControllerPage(),
  ),
  FatimaPage(
    name: '/updater',
    page: () => const UpdaterPage(),
  ),
];
