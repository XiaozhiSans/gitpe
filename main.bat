@echo off && title GitPe
set gitPePath=%cd%
set defaultName="XiaozhiSans"
set defaultEmail="xiaozhisans-awa@outlook.com"

:git_config
copy %gitPePath%\.ssh %userprofile% /y && echo successfully config ssh || echo. && echo copy ".ssh" to %userprofile% faild && echo.
git config --global user.name %defaultName%
git config --global user.email %defaultEmail% && echo.
echo pls check config:
git config --list && echo.
pause