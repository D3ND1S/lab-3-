::@echo off 
chcp 65001
title "Program  №1"
cls
mkdir "Лабораторные"
cd "Лабораторные"
mkdir "Группа"
cd "Группа"
mkdir "Фио"
cd "Фио"
mkdir "batch"
cd "batch"
mkdir "Скрытая папка"
attrib +h "Скрытая папка"
mkdir "Не скрытая папка"
xcopy /? > "Не скрытая папка\copyhelp.txt"
::type "Не скрытая папка\copyhelp.txt"
xcopy "Не скрытая папка\copyhelp.txt" "Скрытая папка\copied_copyhelp.txt" /Y 
pause
exit