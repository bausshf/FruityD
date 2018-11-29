module win32;
@nogc:

version (Windows)
{
  alias BYTE = ubyte;
  alias WORD = ushort;
  alias DWORD = uint;
  alias QWORD = ulong;

  alias ULONG = QWORD;
  alias LONG = long;

  alias PVOID = void*;
  alias HANDLE = PVOID;
  alias HINSTANCE = HANDLE;
  alias HRESULT = LONG;
  alias HWND = HANDLE;

  align(1) struct WAVEFORMATEX
  {
    align(1):
    WORD wFormatTag;
    WORD nChannels;
    DWORD nSamplesPerSec;
    DWORD nAvgBytesPerSec;
    WORD nBlockAlign;
    WORD wBitsPerSample;
    WORD cbSize;
  }

  align(1) struct GUID
  {
    align(1):
    DWORD Data1;
    WORD Data2;
    WORD Data3;
    BYTE[8] Data4;
  }
}
