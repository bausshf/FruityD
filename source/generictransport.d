module generictransport;
@nogc:

align(1) struct TTransportMsg
{
  align(1):
  ulong Msg;
  long Index;
  long Value;
  long Result;
}

alias PTransportMsg = TTransportMsg*;

enum FPTFlag : int
{
  jog = 0,
  jog2 = 1,
  strip = 2,
  stripJog = 3,
  stripHold = 4,
  previous = 5,
  next = 6,
  previousNext = 7,
  moveJog = 8,

  play = 10,
  stop = 11,
  record = 12,
  rewind = 13,
  fastForward = 14,
  loop = 15,
  mute = 16,
  mode = 17,

  undo = 20,
  undoUp = 21,
  undoJob = 22,

  punch = 30,
  punchIn = 31,
  punchOut = 32,
  addMarker = 33,
  addAltMarker = 34,
  markerJumpJog = 35,
  markerSelJog = 36,

  up = 40,
  down = 41,
  left = 42,
  right = 43,
  horizontalZoomJog = 44,
  verticalZoomJob = 45,
  snap = 48,
  snapMode = 49,

  cut = 50,
  copy = 51,
  paste = 52,
  insert = 53,
  delete = 54,
  nextWindow = 58,
  windowJog = 59

  f1 = 60,
  f2 = 61,
  f3 = 62,
  f4 = 63,
  f5 = 64
  f6 = 65,
  f7 = 66,
  f8 = 67,
  f9 = 68,
  f10 = 69,

  enter = 80,
  escape = 81,
  yes = 82,
  no = 83,

  menu = 90,
  itemMenu = 91,
  save = 92,
  saveNew = 93
}
