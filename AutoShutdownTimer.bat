@echo off
chcp 65001 > nul
COLOR 0a
mode con lines=20 cols=100
rem ______________________________________________________________________
:annuler
color 0a
cls
echo #####################################################################
echo #               Annulation de l'extinction programmée                #
echo #####################################################################
shutdown -a
echo.
goto defTime
rem ______________________________________________________________________
:defTime
echo Eteindre l'ordinateur dans combien de temps ?
echo.
rem ----------------------
set /p varheures=Nombre d'heures: 
if not %varheures% LEQ 48 goto timeError
if %varheures% LSS 0 goto timeError
echo.
set /p varminutes=Nombre de minutes: 
if not %varminutes% LEQ 60 goto timeError
if %varminutes% LSS 0 goto timeError
echo.
set /p varsecondes=Nombre de secondes: 
if not %varsecondes% LEQ 60 goto timeError
if %varsecondes% LSS 0 goto timeError
rem ----------------------
echo.
set /a totalTime=(%varheures%*3600)+(%varminutes%*60)+%varsecondes%
if %totalTime% GTR 176460 goto timeError
if %totalTime% LSS 0 goto timeError
rem ----------------------
:validation
echo %totalTime% secondes avant extinction.
echo.
set /p c=Continuer ? (O/N) : 
if /i %c%==o goto eteindre
if /i %c%==n goto fin
goto continuError
rem ______________________________________________________________________
:timeError
echo ########### Nombre Invalide ###########
echo Heure: 48 Minutes: 60 Secondes: 60
pause
cls
goto defTime
rem ______________________________________________________________________
:continuError
echo ########## Entrez une réponse valide ##########
echo ##### Tapez "o" pour Oui, ou "n" pour Non #####
pause
cls
goto validation
rem ______________________________________________________________________
:wait
color 0c
cls
echo #####################################################################
echo # JE SUIS PROGRAMME POUR M'ETEINDRE AUTOMATIQUEMENT. NE PAS TOUCHER #
echo #    ----- Appuyez sur une touche pour annuler l'extinction -----   #
echo #####################################################################
timeout -t %totalTime%
rem /nobreak
goto annuler
rem ______________________________________________________________________
:eteindre
shutdown -s -t %totalTime%
goto wait
rem ______________________________________________________________________
:fin
echo.
echo ########### Fin du Programme ###########
pause
