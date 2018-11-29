module cplug;
@nogc:

version (Windows)
{
  import win32;

  extern (C++) HINSTANCE HInstance;
}

enum DefaultMenuID = 1024;

extern(C++) class TAudioRenderer
{
  private:
  int fSmpRate;
  public:
  double OmegaMul;
  float SmpRateScale;
  float FilterMaxFreq;
  float Ramp_Res_Norm;
  float Ramp_Res_Min;
  float Ramp_Res_FromInt;

  // this(TAudioRenderer *source = null)
  // {
  //
  // }
  //
  // pragma(inline, true)
  // double SamplesToMS(double Time)
  // {
  // }
  //
  // pragma(inline, true)
  // double MSToSamples(double Time)
  // {
  //
  // }
  //
  // int getSmpRate()
  // {
  //
  // }
  //
  // void setSmpRate(int newValue)
  // {
  //
  // }
}
