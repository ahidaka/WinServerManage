@echo off
setlocal  enabledelayedexpansion

if "%~1"=="" (
    echo 使用法: WBDelete.cmd MM-YYYY
    exit /b 1
)

set "date=%~1"
set "month=%date:~0,2%"
set "year=%date:~3,4%"

rem バックアップ設定
set "time=22:00"
set "backupTarget=G:"
set "machine=vivian"

rem 日数の範囲を設定
for /L %%D in (1,1,31) do (
    set "day=%%D"
    if %%D LSS 10 set "day=0%%D"
    set "day=!day!"

    echo wbadmin delete backup -version:%month%/!day!/%year%-%time% -backupTarget:%backupTarget% -machine:%machine% -quiet
)

endlocal
