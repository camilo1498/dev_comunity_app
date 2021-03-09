import 'package:dev_comunity_app/core/viewmodels/login_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...removeProviders
];

/// Remote Providers => Independent
List<SingleChildWidget> removeProviders = [
  ChangeNotifierProvider(create: (_) => LoginViewModel())
];

/// Local Providers => Dependent