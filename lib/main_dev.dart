import 'package:flutter/material.dart';


import 'features/my_app.dart';
import 'flavors/build_config.dart';
import 'flavors/env_config.dart';
import 'flavors/environment.dart';



void main() {
  EnvConfig devConfig = EnvConfig(
    appName: "Weather-DEV",
    baseUrl: "https://weatherapi-com.p.rapidapi.com/",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  runApp(const MyApp());
}
