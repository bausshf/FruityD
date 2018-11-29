module macos;

version (OSX)
{
  alias BOOL = int;

  alias HINSTANCE = intptr_t;
  alias HMENU = intptr_t;
  alias DWORD = int;
  alias HANDLE = intptr_t;
  alias HWND = HANDLE;
  enum NULL = 0;
  enum MAX_PATH = 256;
  alias = RTL_CRITICAL_SECTION = intptr_t;
  alias ULONG = ulong;
  alias HRESULT = long;
  alias ULARGE_INTEGER = ulong;
  alias LARGE_INTEGER = long;
}
