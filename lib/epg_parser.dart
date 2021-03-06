import 'dart:core';

import 'package:fastotv_dart/commands_info/programme_info.dart';
import 'package:xml/xml.dart' as xml;

const String TV_TAG = 'tv';
const String CHANNEL_TAG = 'channel';
const String PROGRAMME_TAG = 'programme';
const String START_TAG = 'start';
const String STOP_TAG = 'stop';
const String TITLE_TAG = 'title';
const String CATEGORY_TAG = 'category';
const String DESCRIPTION_TAG = 'desc';
const int INVALID_UTC_TIME_MILLI_SEC = 8640000000000000;

int _getUtcMSecFromXMLTVString(String data) {
  if (data.isEmpty) {
    return INVALID_UTC_TIME_MILLI_SEC;
  }

  String resultData = '';
  for (int i = 0; i < data.length; ++i) {
    var c = data[i];
    if (c == ' ') {
      continue;
    }

    if (i == 8) {
      resultData += 'T';
    }
    resultData += c;
  }

  try {
    final DateTime dt = DateTime.parse(resultData);
    return dt.millisecondsSinceEpoch;
  } catch (error) {}
  return INVALID_UTC_TIME_MILLI_SEC;
}

List<ProgrammeInfo> parseXmlContent(String data) {
  List<ProgrammeInfo> result = [];
  try {
    final document = xml.parse(data);
    final tv = document.findElements(TV_TAG);
    tv.forEach((elem) {
      final programmes = elem.findElements(PROGRAMME_TAG);
      for (final programme in programmes) {
        final String channel = programme.getAttribute(CHANNEL_TAG);
        final String startText = programme.getAttribute(START_TAG);
        final String stopText = programme.getAttribute(STOP_TAG);
        final start = _getUtcMSecFromXMLTVString(startText);
        final stop = _getUtcMSecFromXMLTVString(stopText);
        final String title = programme.findElements(TITLE_TAG).first.text;

        String category = '';
        final categories = programme.findElements(CATEGORY_TAG);
        if (categories.isNotEmpty) {
          category = programme.findElements(CATEGORY_TAG).first.text;
        }

        String description = '';
        final desc = programme.findElements(DESCRIPTION_TAG);
        if (desc.isNotEmpty) {
          description = programme.findElements(DESCRIPTION_TAG).first.text;
        }

        result.add(ProgrammeInfo(channel, start, stop, title, category, description));
      }
    });
  } catch (error) {
    print(error);
  }

  return result;
}

int getCurrent(List<ProgrammeInfo> programs) {
  final now = DateTime.now();

  int curUtc = now.millisecondsSinceEpoch;
  for (int i = 0; i < programs.length; i++) {
    if (curUtc >= programs[i].start && curUtc <= programs[i].stop) {
      return i;
    }
  }
  return -1;
}
