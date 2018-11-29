module fp_plugclass;

version (macOS)
{
  import macos;
}
else version (Windows)
{
  import win32;

  alias BOOL = bool;
}

extern(C++) abstract class IStream
{
  public:
  abstract void QueryInterface();
  abstract ULONG AddRef();
  abstract ULONG Release();
  abstract HRESULT Read(void* pv, ULONG cb, ULONG *pcbRead);
  abstract HRESULT Write(const void* pv, ULONG cb, ULONG *pcbWritten);
  abstract HRESULT Seek(LARGE_INTEGER, dlibMove, DWORD, dwOrigin, ULARGE_INTEGER *plibNewPosition);
  abstract HRESULT SetSize(ULARGE_INTEGER libNewSize);
  abstract HRESULT CopyTo(IStream *pstm, ULARGE_INTEGER cb, ULARGE_INTEGER *pcbRead, ULARGE_INTEGER *pcbWritten);
  abstract HRESULT Commit(DWORD grfCommitFlags);
  abstract HRESULT Revert();
  abstract HRESULT LockRegion(ULARGE_INTEGER libOffset, ULARGE_INTEGER cb, DWORD dwLockType);
  abstract HRESULT UnlockRegion(ULARGE_INTEGER libOffset, ULARGE_INTEGER cb, DWORD dwLockType);
  abstract HRESULT Stat(void* pstatsth, DWORD grfStatFlag);
  abstract HRESULT Clone(IStream** ppstm);
}

align(4) struct TFruityPlugInfo
{
  align(4):
  int SDKVersion;
  char* LongName;
  char* ShortName;
  int Flags;
  int NumParams;
  int DefPoly;
  int NumOutCtrls;
  int NumOutVoices;
  int[30] Reserved;
}

alias PFruityPlugInfo = TFruityPlugInfo*;

alias TVoiceHandle = intptr_t;
alias TOutVoiceHandle = TVoiceHandle;
alias TPluginTag = intptr_t;

alias TSampleHandle = intptr_t;

align(1) struct TSampleRegion
{
  align(1):
  int SampleStart;
  int SampleEnd;
  char[256] Name;
  char[256] Info;
  float Time;
  int KeyNum;
  int[4] Reserved;
}

alias PSampleRegion = TSampleRegion*;

align(1) struct TSampleInfo
{
  align(1):
  int Size;
  void* Data;
  int Length;
  int SolidLength;
  int LoopStart;
  int LoopEnd;
  double SmpRateConv;
  int NumRegions;
  float NumBeats;
  float Tempo;
  int NumChans;
  int Format;
  int[13] Reserved;
}

alias PSampleInfo = TSampleInfo*;

align(4) struct TVoiceInfo
{
  align(4):
  int Length;
  int Color;
  float Velocity;
  int Flags;
  int[8] Reserved;
}

alias PVoiceInfo = TVoiceInfo*;

align(1) struct TFPTime
{
  align(1):
  double t;
  double t2;
}

align(1) struct TNameColor
{
  align(1):
  char[256] Name;
  char[256] VisName;
  int Color;
  int Index;
}

alias PNameColor = TNameColor*;

align(1) struct TIOBuffer
{
  align(1):
  void* Buffer;
  //BOOL Filled; // Only valid for GetInBuffer ...
  DWORD Flags;
}

alias PIOBuffer = TIOBuffer*;

version (UseOldStructures)
{
  align(4) struct TLevelParams
  {
    align(4):
    int Pan;
    float Vol;
    int Pitch;
    float FCut;
    float FRes;
  }

  align(4) struct TVoiceParams
  {
    align(4):
    TLevelParams InitLevels;
    TLevelParams FinalLevels;
  }
}
else
{
  align(4) struct TLevelParams
  {
    align(4):
    float Pan;
    float Vol;
    float Pitch;
    float FCut;
    float FRes;
  }

  align(4) struct TVoiceParams
  {
    align(4):
    TLevelParams InitLevels;
    TLevelParams FinalLevels;
  }
}

alias PLevelParams = TLevelParams*;
alias PVoiceParams = TVoiceParams*;

align(1) struct TNoteParams
{
  align(1):
  int Position;
  int Length;
  int Pan;
  int Vol;
  short Note;
  short Color;
  int Pitch;
  float FCut;
  float FRes;
}

alias PNoteParams = TNoteParams*;

align(4) struct TNotesParams
{
  align(4):
  int Target;
  int Flags;
  int PatNum;
  int ChanNum;
  int Count;
  TNoteParams[1] NoteParams;
}

alias PNotesParams = TNotesParams;

align(4) struct TParamMenuEntry
{
  align(4):
  char* Name;
  int Flags;
}

alias PParamMenuEntry = TParamMenuEntry*;

extern(C++) abstract class TFruityPlug
{
  public:
  TPluginTag HostTag;
  PFruityPlugInfo Info;
  HWND EditorHandle;
  BOOL MonoRender;
  int Reserved[32];

  abstract void DestroyObject();
  abstract intptr_t Dispatcher(intptr_t ID, intptr_t Index, intptr_t Value);
  abstract void Idle_Public();
  abstract void SaveRestoreState(IStream *Stream, BOOL Save);
  abstract void GetName(int Section, int Index, int Value, char* Name);
  abstract int ProcessEvent(int EventID, int EventValue, int Flags);
  abstract int ProcessParam(int Index, int Value, int RECFlags);

  // ...
}
