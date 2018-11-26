module fp_def;
@nogc:

import win32;

enum WaveT_Bits = 14;
enum WaveT_Size = (1 << WaveT_Bits);
enum WaveT_Shift = (32-WaveT_Bits);
enum WaveT_Step = 1 << WaveT_Shift;
enum WaveT_PMask = (0xFFFFFFFF >> WaveT_Shift);
enum WaveT_FMask = (0xFFFFFFFF >> WaveT_Bits);

enum MIDIMsg_PortMax = 0xFFFFFF;
enum MIDIMsg_Null = 0xFFFFFFFF;

const int FromtMIDI_Max = 65536;
const int FromMIDI_Half = 32768;

alias TWaveT = float[WaveT_Size];
alias PWaveT = TWaveT*;

alias TWAV32FS = float[1][2];
alias PWAV32FS = TWAV32FS*;
alias TWAV32FM = float[1];
alias PWAV32FM = TWAV32FM*;

struct TMIDIOutMsg
{
  ubyte Status;
  ubyte Data1;
  ubyte Data2;
  ubyte Port;
}

alias PMIDIOutMsg = TMIDIOutMsg*;

align(1) struct TWaveFormatExtensible
{
  align(1):
  version (Windows)
  {
    WAVEFORMATEX WaveFormatEx;
  }

  union
  {
    struct
    {
      align(1):
      ushort wValidBitsPerSample;
      ulong dwChannelMask;

      version (Windows)
      {
        GUID SubFormat;
      }
    }

    ushort wSamplesPerBlock;
    ushort wReserved;
  }
}

alias PWaveFormatExtensible = TWaveFormatExtensible*;

struct TSongTime
{
  int Bar;
  int Step;
  int Tick;
}

alias PSongTime = TSongTime*;

struct TTimeSigInfo
{
  int StepsPerBar;
  int StepsPerBeat;
  int PPQ;
}

alias PTimeSigInfo = TTimeSigInfo*;
