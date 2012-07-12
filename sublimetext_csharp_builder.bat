:: Assumptions:
:: - Sublime Text has set the working directory and both the source and executable files
::   are in that directory
:: - The script is capable of handling simple C# apps that reference 3rd-party
::   libraries

:: Inputs from Sublime Text
:: %1 - The full path and filename of the source file to build
:: %2 - The project directory
:: %3 - The name of the executable file name
:: %4 - Compile all the cs files, true or false
:: %5 - The lib directory
:: %6 - Output directory
@SET SRC_FILE=%1
@SET PRJ_DIR=%2
@SET EXE_NAME=%3
@SET RECURSE=%4
@SET LIB_DIR=%5
@SET OUTPUT_DIR=%6

:: Set up build environment. Change this as necessary depending on the version
:: of Visual Studio you wish to use.
@CALL "%VS100COMNTOOLS%vsvars32.bat"

@IF NOT EXIST %OUTPUT_DIR% @MD %OUTPUT_DIR%

@DEL /Q %OUTPUT_DIR%\*.*

@SET TMP_CMD=csc /out:%OUTPUT_DIR%\%EXE_NAME% /recurse:%SRC_FILE% /nologo /debug:full /platform:x86 /lib:Lib

@IF NOT EXIST %LIB_DIR% GOTO :NOLIBDIR

@XCOPY /Y /Q %LIB_DIR%\*.* %OUTPUT_DIR%\

@CD %LIB_DIR%

@FOR %%x in (*.dll) DO @CALL :concat /reference:%%x

@CD ..

@SET TMP_CMD=%TMP_CMD% %TMP_REF%

:NOLIBDIR

@ECHO %TMP_CMD% >> "tmp.cmd"

@CALL "tmp.cmd"

@DEL "tmp.cmd"

@IF errorlevel 1 GOTO end

@IF NOT EXIST %PRJ_DIR% SET PRJ_DIR=.

:: Execute compiled binary if build was successful.
@ECHO.
@ECHO Executing %PRJ_DIR%\%OUTPUT_DIR%\%EXE_NAME%:
@ECHO.
@%PRJ_DIR%\%OUTPUT_DIR%\%EXE_NAME%
:end

:concat
@SET TMP_REF=%TMP_REF% %1