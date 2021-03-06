@echo off

set prefix=x86_64-w64-mingw32-

:: To compile 32-bit, uncomment this:
:: set prefix=i686-w64-mingw32-

taskkill /F /IM ElevatedStartup.exe

%prefix%windres include/resource.rc include/resource.o

if "%1" == "debug" (
  %prefix%gcc -o ElevatedStartup.exe elevatedstartup.c include/resource.o -mwindows -lole32 -g -DDEBUG
) else (
  %prefix%gcc -o ElevatedStartup.exe elevatedstartup.c include/resource.o -mwindows -lole32 -O2 -s

  if "%1" == "run" (
    start ElevatedStartup.exe %2 %3 %4 %5 %6 %7 %8 %9
  )
)
