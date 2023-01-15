@echo on
dir %LIBRARY_PREFIX%
if %ERRORLEVEL% neq 0 exit 1
dir %LIBRARY_PREFIX%\lib
if %ERRORLEVEL% neq 0 exit 1

bash -c "mkdir /tmp"

bash configure --prefix=%LIBRARY_PREFIX%\ ^
  --target=x86_64-win64-vs14 ^
  --as=yasm ^
  --libdir=%LIBRARY_PREFIX%\lib
cat config.log

if %ERRORLEVEL% neq 0 exit 1
