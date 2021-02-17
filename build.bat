@echo off
REM Builds source code frmo src/ with headers from inc/ to populate obj; lib; and bin folders
REM At this time, only builds x64+release; obviously, build-tool-specific checks will have to be added
SET ARCHITECTURE=x64
SET PROFILE=release
echo --- COMPILING ---
cl /EHsc /nologo /c /I inc\ /Fo:obj\%ARCHITECTURE%\%PROFILE%\ src\*
echo --- STATIC ---
lib /nologo /OUT:lib\%ARCHITECTURE%\%PROFILE%\basque.lib obj\%ARCHITECTURE%\%PROFILE%\basque.obj
echo --- EXECUTABLE ---
link /nologo /OUT:bin\%ARCHITECTURE%\%PROFILE%\basque.exe lib\%ARCHITECTURE%\%PROFILE%\basque.lib obj\%ARCHITECTURE%\%PROFILE%\main.obj
echo --- RUNNING ---
CALL bin\%ARCHITECTURE%\%PROFILE%\basque.exe
