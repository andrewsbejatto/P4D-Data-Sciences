@echo off
call rsvars.bat
call get-depends.bat
msbuild /p:BuildGroup=RunTime P4DDataSciencesComponentSuite.groupproj
python.exe convert-depends-to-sbom.py
