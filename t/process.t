#!/usr/bin/env perl6

use Win32::Performance;

my Win32::Performance::HANDLE   $hProcess;
my Win32::Performance::FILETIME $creation;
my Win32::Performance::FILETIME $exit;
my Win32::Performance::FILETIME $kernel;
my Win32::Performance::FILETIME $user;

$hProcess = GetCurrentProcess;
$creation = Win32::Performance::FILETIME.new;
$exit = Win32::Performance::FILETIME.new;
$kernel = Win32::Performance::FILETIME.new;
$user = Win32::Performance::FILETIME.new;
'start'.say;
GetProcessTimes(
  $hProcess,
  $creation,
  $exit,
  $kernel,
  $user,
);
'/start'.say;
$kernel.say;
$user.say;
$creation.say;
$exit.say;
