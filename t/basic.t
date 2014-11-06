#!/usr/bin/env perl6

use Win32::Performance;
use Test;
plan 3;

my $ftime = Win32::Performance::FILETIME.new;
{
  GetTickCount;
  ok 1, 'GetTickCount';
}
{
  GetSystemTimeAsFileTime($ftime);
  ok 1, 'GetSystemTimeAsFileTime call';
  ok $ftime.dwLowDateTime != 0, 'Check $ftime isn\'t initial';
}
done;
