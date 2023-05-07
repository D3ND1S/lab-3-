@echo off

setlocal enableextensions
chcp 65001

rem перевірка, чи передано шлях до каталогу як аргумент, якщо ні то використовуємо поточну директорію
if "%~1"=="" (
  echo Даний скрипт підраховує кількість файлів в підкаталогах %~dp0
  set "target=%~dp0"
) else ( 
  echo Даний скрипт підраховує кількість файлів в підкаталогах %~1
  set "target=%~1"
)

set "count_all=0"
set "count_readonly=0"
set "count_hidden=0"
set "count_archived=0"

echo Підрахунок файлів у каталозі %target% ...
echo.

rem проходження по всіх підкаталогах та підрахунок файлів
for /r "%target%" %%i in (*) do (
  set /a count_all+=1
  if "%%~ai"=="R" set /a count_readonly+=1
  if "%%~ai"=="H" set /a count_hidden+=1
  if "%%~ai"=="A" set /a count_archived+=1
)

echo Загальна кількість файлів: %count_all%
echo Кількість файлів з атрибутом "Тільки читання": %count_readonly%
echo Кількість прихованих файлів: %count_hidden%
echo Кількість файлів з атрибутом "Архівний": %count_archived%
endlocal
echo Підрахунок файлів в підкаталогах завершено успішно.
pause
exit /b 0