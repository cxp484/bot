@echo off
setlocal
set cfast_hash=%1
set smv_hash=%2
set branch_name=%3

set CURDIR=%CD%
cd ..\..\..\..
set ROOTDIR=%CD%
cd %CURDIR%

cd ..\..\Scripts
call setup_repos -C -n

cd %CURDIR%

cd %ROOTDIR%\cfast
set cfastrepo=%CD%

cd %ROOTDIR%\smv
set smvrepo=%CD%

cd %cfastrepo%

set hash=%cfast_hash%
if %hash% == latest set hash=
git checkout -b %branch_name% %hash%

git describe --abbrev=7 --dirty --long
git branch -a

cd %smvrepo%

set hash=%smv_hash%
if %hash% == latest set hash=
git checkout -b %branch_name% %hash%

git describe --abbrev=7 --dirty --long
git branch -a

cd %CURDIR%
