import 'dart:convert';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:lettutor/data/network/apis/api.dart';
import 'package:lettutor/data/sharedpref/preferences.dart';
import 'package:lettutor/data/sharedpref/shared_preference_helper.dart';
import 'package:lettutor/models/schedule.dart';
import 'package:lettutor/services/parser_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScheduleService {
  ScheduleService._privateConstructor();

  static final ScheduleService _instance = ScheduleService._privateConstructor();

  static ScheduleService get instance => _instance;

  final _scheduleApi = ScheduleApi.instance;

  Future<List<Schedule>?> getStudiedClasses(String page, String perPage) async {


    try {
      var res = await _scheduleApi.getStudiedClasses(page, perPage);

      if (res.statusCode != null && res.statusCode == 200) {
        return ParserService.parseListSchedule(res.toString());
      }
      return null;
    } catch(e) {
      rethrow;
    }
  }

  Future<List<Schedule>?> getUpcomingClasses(String page, String perPage) async {


    try {
      var res = await _scheduleApi.getUpcomingClasses(page, perPage);

      if (res.statusCode != null && res.statusCode == 200) {
        return ParserService.parseListSchedule(res.toString());
      }
      return null;
    } catch(e) {
      rethrow;
    }
  }

  Future<bool> cancelBookedClassed(String scheduleDetailId) async {

    try {
      var res = await _scheduleApi.cancelBookedClasses(scheduleDetailId);

      if (res.statusCode != null && res.statusCode == 200) {
        return true;
      }
      return false;
    } catch(e) {
      rethrow;
    }
  }

  joinMeeting(String tokenMeeting) async {

    String subString = tokenMeeting.split('.')[1];

    String decoded = utf8.fuse(base64).decode(subString);

    var jsonRes = jsonDecode(decoded);

    SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();

    String? savedToken = sharedPreferences.getString(Preferences.auth_token);

    print('ACCESS TOKEN: ' + savedToken!);

    String? serverUrl = 'https://meet.lettutor.com';

    // Enable or disable any feature flag here
    // If feature flag are not provided, default values will be used
    // Full list of feature flags (and defaults) available in the README
    Map<FeatureFlagEnum, bool> featureFlags = {
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
    };
    if (!kIsWeb) {
      // Here is an example, disabling features for each platform
      if (Platform.isAndroid) {
        // Disable ConnectionService usage on Android to avoid issues (see README)
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        // Disable PIP on iOS as it looks weird
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
    }
    // Define meetings options here
    var options = JitsiMeetingOptions(room: jsonRes['room'])
      ..serverURL = serverUrl
      ..subject = "sTutoring"
      ..userDisplayName = jsonRes['userCall']['name']
      ..userEmail = jsonRes['userCall']['email']
      ..audioOnly = false
      ..audioMuted = true
      ..videoMuted = true
      ..token = savedToken
      ..featureFlags.addAll(featureFlags)
      ..webOptions = {
        "roomName": jsonRes['roomName'],
        "width": "100%",
        "height": "100%",
        "enableWelcomePage": false,
        "chromeExtensionBanner": null,
        "userInfo": {"displayName": ""}
      };

    debugPrint("JitsiMeetingOptions: $options");
    await JitsiMeet.joinMeeting(
      options,
      listener: JitsiMeetingListener(
          onConferenceWillJoin: (message) {
            debugPrint("${options.room} will join with message: $message");
          },
          onConferenceJoined: (message) {
            debugPrint("${options.room} joined with message: $message");
          },
          onConferenceTerminated: (message) {
            debugPrint("${options.room} terminated with message: $message");
          },
          genericListeners: [
            JitsiGenericListener(
                eventName: 'readyToClose',
                callback: (dynamic message) {
                  debugPrint("readyToClose callback");
                }),
          ]),
    );
  }


}
