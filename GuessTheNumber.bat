@echo off
title Guess the Number Game
color 0a

:START
cls
echo Welcome to Guess the Number!
echo I have chosen a number between 1 and 100.
echo You have 10 attempts to guess it.
set /a number=%random% %% 100 + 1
set attempts=10

:GAME
echo.
echo Attempts left: %attempts%
set /p guess="Enter your guess: "
if %guess% GTR 100 echo Please enter a number between 1 and 100! & goto GAME
if %guess% LSS 1 echo Please enter a number between 1 and 100! & goto GAME
set /a attempts-=1

if %guess% EQU %number% goto WIN
if %attempts% EQU 0 goto LOSE
if %guess% GTR %number% echo Too high! Try again. & goto GAME
if %guess% LSS %number% echo Too low! Try again. & goto GAME

:WIN
cls
echo Congratulations! You guessed the number %number% correctly!
echo.
set /p play="Play again? (y/n): "
if /i "%play%"=="y" goto START
if /i "%play%"=="n" goto END
echo Invalid input! Enter y or n. & goto WIN

:LOSE
cls
echo Game Over! The number was %number%.
echo.
set /p play="Play again? (y/n): "
if /i "%play%"=="y" goto START
if /i "%play%"=="n" goto END
echo Invalid input! Enter y or n. & goto LOSE

:END
cls
echo Thanks for playing!
pause
exit