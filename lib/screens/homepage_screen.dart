import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sharehub/utils/colors.dart';
import 'package:sharehub/utils/design_styles.dart';
import 'package:sharehub/utils/strings.dart';
import 'package:sharehub/utils/text_styles.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late List<Event> eventData;

  String jsonString = '''[
  {
    "eventImage": "https://res.cloudinary.com/deeqsba43/image/upload/v1691336265/cld-sample-2.jpg",
    "eventName": "Party",
    "eventDescription": "Years experience, lights, fans, wiring, appliance",
    "totalPhotos": 20,
    "totalVideos": 10,
    "totalAudios": 10
  },
  {
    "eventImage": "https://res.cloudinary.com/deeqsba43/image/upload/v1691336265/cld-sample-2.jpg",
    "eventName": "Party",
    "eventDescription": "Years experience, lights, fans, wiring, appliance",
    "totalPhotos": 20,
    "totalVideos": 10,
    "totalAudios": 10
  },
  {
    "eventImage": "https://res.cloudinary.com/deeqsba43/image/upload/v1691336265/cld-sample-2.jpg",
    "eventName": "Party",
    "eventDescription": "Years experience, lights, fans, wiring, appliance",
    "totalPhotos": 20,
    "totalVideos": 10,
    "totalAudios": 10
  },
  {
    "eventImage": "https://res.cloudinary.com/deeqsba43/image/upload/v1691336265/cld-sample-2.jpg",
    "eventName": "Party",
    "eventDescription": "Years experience, lights, fans, wiring, appliance",
    "totalPhotos": 20,
    "totalVideos": 10,
    "totalAudios": 10
  },
  {
    "eventImage": "https://res.cloudinary.com/deeqsba43/image/upload/v1691336265/cld-sample-2.jpg",
    "eventName": "Party",
    "eventDescription": "Years experience, lights, fans, wiring, appliance",
    "totalPhotos": 20,
    "totalVideos": 10,
    "totalAudios": 10
  },
  {
    "eventImage": "https://res.cloudinary.com/deeqsba43/image/upload/v1691336265/cld-sample-2.jpg",
    "eventName": "Party",
    "eventDescription": "Years experience, lights, fans, wiring, appliance",
    "totalPhotos": 20,
    "totalVideos": 10,
    "totalAudios": 10
  },
  {
    "eventImage": "https://res.cloudinary.com/deeqsba43/image/upload/v1691336265/cld-sample-2.jpg",
    "eventName": "Party",
    "eventDescription": "Years experience, lights, fans, wiring, appliance",
    "totalPhotos": 20,
    "totalVideos": 10,
    "totalAudios": 10
  },
  {
    "eventImage": "https://res.cloudinary.com/deeqsba43/image/upload/v1691336265/cld-sample-2.jpg",
    "eventName": "Party",
    "eventDescription": "Years experience, lights, fans, wiring, appliance",
    "totalPhotos": 20,
    "totalVideos": 10,
    "totalAudios": 10
  },
  {
    "eventImage": "https://res.cloudinary.com/deeqsba43/image/upload/v1691336265/cld-sample-2.jpg",
    "eventName": "Party",
    "eventDescription": "Years experience, lights, fans, wiring, appliance",
    "totalPhotos": 20,
    "totalVideos": 10,
    "totalAudios": 10
  },
  {
    "eventImage": "https://res.cloudinary.com/deeqsba43/image/upload/v1691336265/cld-sample-2.jpg",
    "eventName": "Party",
    "eventDescription": "Years experience, lights, fans, wiring, appliance",
    "totalPhotos": 20,
    "totalVideos": 10,
    "totalAudios": 10
  }
  ]''';

  handleMenuClick() {
    _scaffoldKey.currentState?.openDrawer();
  }

  handleSettingsClick() {}

  Future<void> fetchData() async {
    try {
      List<dynamic> jsonData = jsonDecode(jsonString);
      eventData = jsonData.map((item) => Event.fromJson(item)).toList();
      // Simulate a network request delay
      await Future.delayed(const Duration(seconds: 3));
    } catch (e) {
      rethrow; // Rethrow the exception to let FutureBuilder handle it
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: Center(
            child: Text(
              AppStrings.appTitle,
              style: AppTextStyles.title.merge(AppTextStyles.textWhite),
            ),
          ),
          leading: IconButton(
            onPressed: handleMenuClick,
            icon: const Icon(
              Icons.menu_rounded,
              color: AppColors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: handleSettingsClick,
              icon: const Icon(
                Icons.settings_rounded,
                color: AppColors.white,
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code), label: AppStrings.scan),
            BottomNavigationBarItem(
                icon: Icon(Icons.add), label: AppStrings.add),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded),
                label: AppStrings.profile),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.tertiary,
          backgroundColor: AppColors.primary,
          type: BottomNavigationBarType.fixed,
        ),
        resizeToAvoidBottomInset: false,
        body: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.primary,
              ));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children:
                            List.generate(eventData.length * 2 - 1, (index) {
                          if (index.isEven) {
                            int itemIndex = index ~/ 2;
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/allPhotosScreen',
                                );
                              },
                              child: eventElement(
                                  eventData[itemIndex].eventImage,
                                  eventData[itemIndex].eventName,
                                  eventData[itemIndex].eventDescription,
                                  eventData[itemIndex].totalPhotos,
                                  eventData[itemIndex].totalVideos,
                                  eventData[itemIndex].totalAudios),
                            );
                          } else {
                            return const SizedBox(height: 10);
                          }
                        }),
                      ),
                    )),
              );
              // );
            }
          },
        ),
      ),
    );
  }

  Widget eventElement(
      String eventImage,
      String eventName,
      String eventDescription,
      int totalPhotos,
      int totalVideos,
      int totalAudios) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/allPhotosScreen',
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [AppShadowStyles.largeShadow]),
        // decoration: BoxDecoration(),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 90.0,
              clipBehavior: Clip.antiAlias,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
              ),
              child: Image.network(eventImage, fit: BoxFit.fill),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                width: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      eventName,
                      style: AppTextStyles.text1,
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      eventDescription,
                      style: AppTextStyles.textSmall
                          .merge(AppTextStyles.textMediumGrey),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 70.0,
              width: 34.0,
              margin: const EdgeInsets.only(right: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.photo_rounded,
                          color: AppColors.iconGrey, size: 16.0),
                      const SizedBox(width: 2),
                      Text(
                        totalPhotos.toString(),
                        style: AppTextStyles.text1
                            .merge(AppTextStyles.textMediumGrey),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.video_collection_rounded,
                          color: AppColors.iconGrey, size: 16.0),
                      const SizedBox(width: 2),
                      Text(
                        totalVideos.toString(),
                        style: AppTextStyles.text1
                            .merge(AppTextStyles.textMediumGrey),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.audiotrack_rounded,
                          color: AppColors.iconGrey, size: 16.0),
                      const SizedBox(width: 2),
                      Text(
                        totalAudios.toString(),
                        style: AppTextStyles.text1
                            .merge(AppTextStyles.textMediumGrey),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Event {
  final String eventImage;
  final String eventName;
  final String eventDescription;
  final int totalPhotos;
  final int totalVideos;
  final int totalAudios;

  Event(
      {required this.eventImage,
      required this.eventName,
      required this.eventDescription,
      required this.totalPhotos,
      required this.totalVideos,
      required this.totalAudios});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        eventImage: json['eventImage'],
        eventName: json['eventName'],
        eventDescription: json['eventDescription'],
        totalPhotos: json['totalPhotos'],
        totalVideos: json['totalVideos'],
        totalAudios: json['totalAudios']);
  }
}
