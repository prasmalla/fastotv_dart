enum StreamType {
  PROXY,
  RELAY,
  ENCODE,
  TIMESHIFT_PLAYER,
  TIMESHIFT_RECORDER,
  CATCHUP,
  TEST_LIFE,
  VOD_RELAY,
  VOD_ENCODE,
  COD_RELAY,
  COD_ENCODE,
}

StreamType StreamType2Enum(int number) {
  if (number == 0) {
    return StreamType.PROXY;
  } else if (number == 1) {
    return StreamType.RELAY;
  } else if (number == 2) {
    return StreamType.ENCODE;
  } else if (number == 3) {
    return StreamType.TIMESHIFT_PLAYER;
  } else if (number == 4) {
    return StreamType.TIMESHIFT_RECORDER;
  } else if (number == 5) {
    return StreamType.CATCHUP;
  } else if (number == 6) {
    return StreamType.TEST_LIFE;
  } else if (number == 7) {
    return StreamType.VOD_RELAY;
  } else if (number == 8) {
    return StreamType.VOD_ENCODE;
  } else if (number == 9) {
    return StreamType.COD_RELAY;
  }
  return StreamType.COD_ENCODE;
}
