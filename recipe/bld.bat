bash configure --prefix=%LIBRARY_PREFIX%\ ^
  --target=x86_64-win64-vs14 ^
  --as=yasm

if %ERRORLEVEL% neq 0 exit 1
