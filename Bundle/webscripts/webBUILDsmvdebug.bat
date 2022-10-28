@echo off
set platform=%1

:: batch file to build test or release smokeview on Windows, Linux or OSX platforms

:: setup environment variables (defining where repository resides etc) 

set envfile="%userprofile%"\fds_smv_env.bat
IF EXIST %envfile% GOTO endif_envexist
echo ***Fatal error.  The environment setup file %envfile% does not exist. 
echo Create a file named %envfile% and use smv/scripts/fds_smv_env_template.bat
echo as an example.
echo.
echo Aborting now...
pause>NUL
goto:eof

:endif_envexist

call %envfile%
echo.
echo  Building debug test Smokeview for %platform%
Title Building debug test Smokeview for %platform%

%svn_drive%

if "%platform%" == "Windows" (
  cd %svn_root%\smv\Build\smokeview\intel_win_64
  call make_smokeview_db -test -glut -icon
  goto eof
)

:: ----------- linux -----------------

if "%platform%" == "Linux" (
  plink %plink_options% %linux_logon% %linux_svn_root%/smv/scripts/run_command.sh smv/Build/smokeview/intel_linux_64 make_smokeview_db.sh -t
  goto eof
)

:: ----------- osx -----------------

if "%platform%" == "OSX" (
  plink %plink_options% %osx_logon% %linux_svn_root%/smv/scripts/run_command.sh smv/Build/smokeview/intel_osx_64 make_smokeview_db.sh -t
  goto eof
)

:eof
echo.
echo compilation complete
pause
