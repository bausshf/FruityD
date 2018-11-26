module fp_extra;
@nogc:

import std.math : log;

align(1) union T32Bit
{
  align(1):
  int i;
  float s;
  ubyte[4] buffer;
}

enum MaxPath = 1024;

enum NoteMul = 0.00057762267534;

enum MixSmpRate_Default = 44100;

enum MiddleCFreq = 523.251130601197;
const double MiddleCMul = (cast(float)0x10000000) * MiddleCFreq * (cast(float)0x10);

const double Div2 = 0.5;
const double Div4 = 0.25;
const double Div8 = 0.125;
const double Div10 = 0.1;
const double Div100 = 0.01;
const double Div128 = (cast(float)1) / (cast(float)128);
const double Div256 = (cast(float)1) / (cast(float)256);
const double Div1024 = (cast(float)1) / (cast(float)1024);

int MinOf(int a, int b) pure nothrow @safe
{
  if (a < b)
  {
    return a;
  }

  return b;
}

const float MaxVolume = 261 * 10 / 127;

float InvLogVol(float Value, float MaxValue) pure nothrow @safe
{
  import std.math : log;

  return log(Value + 1) / log(MaxValue + 1);
}

float VolumeToVelocity(float Volume) pure nothrow @safe
{
  return InvLogVol(Volume * 10, MaxVolume)
}

float VolumeToMIDIVelocity(float Volume) pure nothrow @safe
{
  return InvLogVol(Volume * 10, MaxVolume) * 127;
}
