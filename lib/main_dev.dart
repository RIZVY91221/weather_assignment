import 'package:flutter/material.dart';


import 'features/my_app.dart';
import 'flavors/build_config.dart';
import 'flavors/env_config.dart';
import 'flavors/environment.dart';



void main() {
  EnvConfig devConfig = EnvConfig(
    appName: "Weather-DEV",
    baseUrl: "https://drive.google.com/file/d/1T_YlGz7PsGoTZgZhyQ2RF46omvURg6SO/",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  runApp(const MyApp());
}
