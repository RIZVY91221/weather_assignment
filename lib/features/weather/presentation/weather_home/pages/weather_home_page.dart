import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_assignment/core/base/base_view.dart';
import 'package:weather_assignment/core/widget/loading.dart';
import 'package:weather_assignment/features/weather/presentation/weather_home/controller/weather_home_controller.dart';
import '../../../../../core/values/text_styles.dart';
import '../../../../../core/widget/pagging_view.dart';

class WeatherHomePage extends BaseView<WeatherHomeController>{
  WeatherHomePage(){
    controller.getWeatherListFunction();
  }
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return PagingView(
      onRefresh: () async {
        controller.onRefreshPage();
      },
      onLoadNextPage: () {
        controller.onLoadNextPage();
      },
      child: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.black : Colors.white,
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Obx(()=>controller.getWeatherList.isNotEmpty?Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.01,
                          horizontal: size.width * 0.05,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.bars,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                            Align(
                              child: Text(
                                'Weather App',
                                style: GoogleFonts.questrial(
                                  color: isDarkMode
                                      ? Colors.white
                                      : const Color(0xff1D1617),
                                  fontSize: size.height * 0.02,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap:()=>_showDialog(context) ,
                              child: FaIcon(
                                FontAwesomeIcons.plusCircle,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                          left: size.width * 0.01,
                          right: size.width * 0.01,
                        ),
                        child: Align(
                          child: Text(
                            controller.cityName.value,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.questrial(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontSize: size.height * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.005,
                        ),
                        child: Align(
                          child: Text(
                            'Today',
                            style: GoogleFonts.questrial(
                              color:
                              isDarkMode ? Colors.white54 : Colors.black54,
                              fontSize: size.height * 0.035,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                        ),
                        child: Align(
                          child: controller.getWeatherList.isNotEmpty
                              ? Text(
                            "${controller.getWeatherList.first.hour[controller.hoursList[0]]['temp_c'].round()}˚C",
                            style: GoogleFonts.questrial(
                              color: controller.getWeatherList.first
                                  .hour[controller.hoursList[0]]['temp_c']
                                  .round() <=
                                  0
                                  ? Colors.blue
                                  : controller.getWeatherList.first.hour[controller.hoursList[0]]['temp_c']
                                  .round() >
                                  0 &&
                                  controller.getWeatherList
                                      .first
                                      .hour[controller.hoursList[0]]
                                  ['temp_c']
                                      .round() <=
                                      15
                                  ? Colors.indigo
                                  : controller.getWeatherList
                                  .first
                                  .hour[controller.hoursList[0]]
                              ['temp_c']
                                  .round() >
                                  15 &&
                                  controller.getWeatherList
                                      .first
                                      .hour[controller.hoursList[0]]
                                  ['temp_c']
                                      .round() <
                                      30
                                  ? Colors.orange
                                  : Colors.pink,
                              fontSize: size.height * 0.13,
                            ),
                          )
                              : SizedBox(
                            height: size.width * 0.265,
                            width: size.width * 0.265,
                            child: Transform.scale(
                              scale: 1,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2.0,
                                valueColor:
                                AlwaysStoppedAnimation(Colors.indigo),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.25),
                        child: Divider(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      controller.getWeatherList.isNotEmpty
                          ? Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.005,
                          left: size.width * 0.01,
                          right: size.width * 0.01,
                        ),
                        child: Align(
                          child: Text(
                            '${controller.getWeatherList[1].hour.first['condition']['text']}',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.questrial(
                              color: isDarkMode
                                  ? Colors.white54
                                  : Colors.black54,
                              fontSize: size.height * 0.03,
                            ),
                          ),
                        ),
                      )
                          : Container(),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.01,
                          bottom: size.height * 0.01,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            controller.getWeatherList.isNotEmpty
                                ? Text(
                              '${controller.getWeatherList[0].minTemp}˚C',
                              style: GoogleFonts.questrial(
                                color: controller.getWeatherList[0].minTemp <= 0
                                    ? Colors.blue
                                    : controller.getWeatherList[0].minTemp > 0 &&
                                    controller.getWeatherList[0].minTemp <= 15
                                    ? Colors.indigo
                                    : controller.getWeatherList[0].minTemp > 15 &&
                                    controller.getWeatherList[0].minTemp < 30
                                    ? Colors.deepPurple
                                    : Colors.pink,
                                fontSize: size.height * 0.03,
                              ),
                            )
                                : Container(),
                            Text(
                              '/',
                              style: GoogleFonts.questrial(
                                color: isDarkMode
                                    ? Colors.white54
                                    : Colors.black54,
                                fontSize: size.height * 0.03,
                              ),
                            ),
                            controller.getWeatherList.isNotEmpty
                                ? Text(
                              '${controller.getWeatherList[0].maxTemp}˚C',
                              style: GoogleFonts.questrial(
                                color: controller.getWeatherList[0].maxTemp <= 0
                                    ? Colors.blue
                                    : controller.getWeatherList[0].maxTemp > 0 &&
                                    controller.getWeatherList[0].maxTemp <= 15
                                    ? Colors.indigo
                                    : controller.getWeatherList[0].maxTemp > 15 &&
                                    controller.getWeatherList[0].maxTemp < 30
                                    ? Colors.orange
                                    : Colors.pink,
                                fontSize: size.height * 0.03,
                              ),
                            )
                                : Container(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: isDarkMode
                                ? Colors.white.withOpacity(0.05)
                                : Colors.black.withOpacity(0.05),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.01,
                                    left: size.width * 0.03,
                                  ),
                                  child: Text(
                                    'Forecast for today',
                                    style: GoogleFonts.questrial(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: size.height * 0.28,
                                margin: const EdgeInsets.all(20),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.hoursList.isNotEmpty
                                      ? controller.hoursList.length <= controller.forecastResultsCount
                                      ? controller.forecastResultsCount
                                      : controller.hoursList.length
                                      : 0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return controller.getWeatherList.isNotEmpty
                                        ? buildForecastToday(
                                      index == 0
                                          ? 'Now'
                                          : "${controller.hoursList[index]}:00",
                                      index >
                                          controller.hoursList.length -
                                              controller.hoursNextDay -
                                              1
                                          ? controller.getWeatherList[1]
                                          .hour[controller.hoursList[index]]
                                      ['temp_c']
                                          .round()
                                          : controller.getWeatherList
                                          .first
                                          .hour[controller.hoursList[index]]
                                      ['temp_c']
                                          .round(),
                                      index >
                                          controller.hoursList.length -
                                              controller.hoursNextDay -
                                              1
                                          ? controller.getWeatherList[1]
                                          .hour[controller.hoursList[index]]
                                      ['wind_kph']
                                          .round()
                                          : controller.getWeatherList
                                          .first
                                          .hour[controller.hoursList[index]]
                                      ['wind_kph']
                                          .round(),
                                      index >
                                          controller.hoursList.length -
                                              controller.hoursNextDay -
                                              1
                                          ? controller.getWeatherList[1]
                                          .hour[controller.hoursList[index]]
                                      ['chance_of_rain']
                                          .round()
                                          : controller.getWeatherList
                                          .first
                                          .hour[controller.hoursList[index]]
                                      ['chance_of_rain']
                                          .round(),
                                      index >
                                          controller.hoursList.length -
                                              controller.hoursNextDay -
                                              1
                                          ? controller.getWeatherList[1]
                                          .hour[controller.hoursList[index]]
                                      ['condition']['icon']
                                          : controller.getWeatherList.first
                                          .hour[controller.hoursList[index]]
                                      ['condition']['icon'],
                                      size,
                                      isDarkMode,
                                    )
                                        : Container();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.height * 0.02,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.white.withOpacity(0.05),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.02,
                                    left: size.width * 0.03,
                                  ),
                                  child: Text(
                                    '3-day forecast',
                                    style: GoogleFonts.questrial(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                              Padding(
                                padding: EdgeInsets.all(size.width * 0.00),
                                child: Column(
                                  children: [
                                    controller.getWeatherList.isNotEmpty
                                        ? buildThreeDayForecast(
                                      "Today",
                                      controller.getWeatherList[0].minTemp,
                                      controller.getWeatherList[0].maxTemp,
                                      controller.getWeatherList[0].icon,
                                      size,
                                      isDarkMode,
                                    )
                                        : Container(),
                                    controller.getWeatherList.isNotEmpty
                                        ? buildThreeDayForecast(
                                      "Tomorrow",
                                      controller.getWeatherList[1].minTemp,
                                      controller.getWeatherList[1].maxTemp,
                                      controller.getWeatherList[1].icon,
                                      size,
                                      isDarkMode,
                                    )
                                        : Container(),
                                    controller.getWeatherList.isNotEmpty
                                        ? buildThreeDayForecast(
                                      "A.Tomorrow",
                                      controller.getWeatherList[2].minTemp,
                                      controller.getWeatherList[2].maxTemp,
                                      controller.getWeatherList[2].icon,
                                      size,
                                      isDarkMode,
                                    )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ):const SizedBox.shrink())
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildForecastToday(String time, int temp, int wind, int rainChance,
      String weatherIcon, size, bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.005),
      child: Column(
        children: [
          Text(
            time,
            style: GoogleFonts.questrial(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: size.height * 0.02,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.005,
            ),
            child: Image.network(
              'http:$weatherIcon',
              height: size.height * 0.05,
              width: size.width * 0.1,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            '$temp˚C',
            style: GoogleFonts.questrial(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: size.height * 0.025,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                ),
                child: FaIcon(
                  FontAwesomeIcons.wind,
                  color: Colors.grey,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            '$wind km/h',
            style: GoogleFonts.questrial(
              color: Colors.grey,
              fontSize: size.height * 0.017,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                ),
                child: FaIcon(
                  FontAwesomeIcons.umbrella,
                  color: Colors.blue,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            '$rainChance %',
            style: GoogleFonts.questrial(
              color: Colors.blue,
              fontSize: size.height * 0.02,
            ),
          ),
        ],
      ),
    );
  }
  Widget buildThreeDayForecast(String time, int minTemp, int maxTemp,
      String weatherIcon, size, bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: size.width * 0.25,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.network(
                  'http:$weatherIcon',
                  alignment: Alignment.topCenter,
                  height: size.height * 0.05,
                  width: size.width * 0.1,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.02,
                vertical: size.height * 0.01,
              ),
              child: Text(
                time,
                style: GoogleFonts.questrial(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: size.height * 0.025,
                ),
              ),
            ),
            Align(
              child: Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.15,
                  top: size.height * 0.01,
                ),
                child: Text(
                  '$minTemp˚C',
                  style: GoogleFonts.questrial(
                    color: isDarkMode ? Colors.white38 : Colors.black38,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.01,
                ),
                child: Text(
                  '$maxTemp˚C',
                  style: GoogleFonts.questrial(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ],
    );
  }

  _showDialog(BuildContext context)=>showDialog(
      context: context,
      builder: (context)=> AlertDialog(
        title: const Text("Search Weather By City",style: cardTitleCyanStyle,),
        contentPadding:  const EdgeInsets.all(16.0),
        content:Row(
          children: [
            Expanded(child:
            TextFormField(
              controller: controller.cityController,
              decoration: InputDecoration(// Added this
                  fillColor: Colors.white70,
                  filled: true,
                  contentPadding: const EdgeInsets.all(2),
                  hintText: 'Enter City',
                  hintStyle: const TextStyle(
                      fontSize: 12,color: Colors.black,fontWeight: FontWeight.w400
                  ),

                  labelStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.0),
                    borderSide:
                    const BorderSide(color: Colors.black, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.location_city,color: Colors.red,),
                  suffixIcon: controller.cityController.text.isNotEmpty?IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: ()=>controller.cityController.clear()
                  ):const Text('')
              ),
              keyboardType: TextInputType.text,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'city required';
                }

                return null;
              },
            ),
            ),
          ],
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  child: const Text('Cancel',style:whiteText18 ,),
                  onPressed: () {
                    controller.cityController.clear();
                    Get.back();
                  }),
              ElevatedButton(
                  child: const Text('Search',style:whiteText18),
                  onPressed: () {
                    print("sea");
                    controller. onRefreshPage();
                    controller.cityController.clear();
                    Get.back();
                  })
            ],
          )
        ],
      )
  );

}