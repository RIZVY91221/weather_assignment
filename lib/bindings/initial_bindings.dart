import 'package:get/get.dart';
import 'package:weather_assignment/bindings/repository_bindings.dart';
import 'internet_connection_bindings.dart';
import 'local_source_bindings.dart';
import 'remote_source_bindings.dart';

class InitialBindings extends Bindings{

  @override
  void dependencies() {
    LocalSourceBindings().dependencies();
    RemoteSourceBindings().dependencies();
    InternetConnectionBindings().dependencies();
    RepositoryBindings().dependencies();
  }

}