@echo off
cd /d "%~dp0"
echo.
echo Uploading to GitHub / Netlify...
echo.

git add .
if errorlevel 1 goto fail

git -c user.name=axc15 -c user.email=axc1527-ops@users.noreply.github.com commit -m "site update"
if errorlevel 1 (
    echo.
    echo No changes to upload.
    goto end
)

git push origin main
if errorlevel 1 goto fail

echo.
echo SUCCESS! Wait 1-2 minutes, then open:
echo https://heartfelt-paprenjak-213014.netlify.app/
goto end

:fail
echo.
echo FAILED. Send a screenshot of this window.
pause
exit /b 1

:end
echo.
pause
