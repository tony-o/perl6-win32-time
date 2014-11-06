module Win32::Performance;

use NativeCall;

class FILETIME is repr('CStruct') {
  has uint32 $.dwLowDateTime;
  has uint32 $.dwHighDateTime;
};

class PVOID  is repr('CPointer') { has num64 $.unused; };
class HANDLE is repr('CStruct') { has int32 $.unused; };
  #has str $.machine;  
  #has str $.nmpipe;
#};

#class u is repr('CStruct') {
#  has int $.LowPart;
#  has num64 $.HighPart;
#};
#
#class LARGE_INTEGER is repr('CStruct') {
#  has int $.LowPart;
#  has num64 $.HighPart;
##  has CStruct $.u;
#  has num64 $.QuadPart;
#};

sub GetTickCount()
  returns Int
  is native('KERNEL32')
  is export
  { * };

sub GetSystemTimeAsFileTime(Win32::Performance::FILETIME $filetime)
  is native('KERNEL32')
  is export
  { * };

#sub QueryPerformanceFrequency(Win32::Performance::LARGE_INTEGER $largeint)
#  returns Bool
#  is native('KERNEL32')
#  is export
#  { * };
#
#sub QueryPerformanceCounter(Win32::Performance::LARGE_INTEGER $largeint)
#  returns Bool
#  is native('KERNEL32')
#  is export
#  { * };

sub GetThreadTimes(
    int $hThread,
    Win32::Performance::FILETIME $creation,
    Win32::Performance::FILETIME $exit,
    Win32::Performance::FILETIME $kernel,
    Win32::Performance::FILETIME $user)
  #returns bool
  is native('KERNEL32')
  is export
  { * };

sub GetCurrentProcess()
  returns Win32::Performance::HANDLE
  is native('KERNEL32')
  is export
  { * };

sub GetCurrentProcessId()
  returns int 
  is native('KERNEL32')
  is export
  { * };

sub GetProcessTimes(
    Win32::Performance::HANDLE   $hProcess,
    Win32::Performance::LPFILETIME $creation,
    Win32::Performance::LPFILETIME $exit,
    Win32::Performance::LPFILETIME $kernel,
    Win32::Performance::LPFILETIME $user)
  #returns bool
  is native('KERNEL32')
  is export
  { * };
