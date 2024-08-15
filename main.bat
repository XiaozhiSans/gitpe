@echo off && title GitPe
set gitPePath=%cd%
set defaultName="XiaozhiSans"
set defaultEmail="xiaozhisans-awa@outlook.com"
set enableAs=true
set signKeyType="ssh"
set gpgKeyPath=""
set sshKeyPath=""

:git_config
mkdir %userprofile%\.ssh
copy %gitPePath%\.ssh %userprofile%\.ssh /y && sh ssh.sh || echo. && echo copy ".ssh" to %userprofile% faild && echo.
git config --global user.name %defaultName%
git config --global user.email %defaultEmail% && echo.

if %enableAs%==true (
    git config --global commit.gpgsign true
    git config --global tag.gpgsign true
)
if %signKeyType%=="ssh" (
    git config --global gpg.format ssh
    git config --global user.signingKey ~/.ssh/id_rsa
    git config gpg.ssh.allowedSignersFile "$HOME/.config/git/allowed_signers"
)
:: else (
    :: 我没怎么用过gpg啊 不知道默认路径 反正我也不用gpgKey 先咕咕咕(
:: )
echo pls check config:
git config --list && echo.

pause