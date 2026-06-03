@echo off
chcp 65001 >nul
echo.
echo ╔══════════════════════════════════════╗
echo ║   🚀 个人网页自动同步脚本         ║
echo ║   sync to yuzijiang-xianyu.github.io  ║
echo ╚══════════════════════════════════════╝
echo.

cd /d "%~dp0"

echo [1/3] 检查文件变更...
git add -A
git diff --cached --quiet
if %errorlevel% equ 0 (
    echo    ✅ 没有新变更，无需推送
    echo.
    pause
    exit /b 0
)

echo [2/3] 提交变更...
set /p MSG="    📝 请输入本次更新说明（直接回车使用默认）: "
if "%MSG%"=="" set MSG=🔧 更新个人网页 %date% %time%
git commit -m "%MSG%"

echo [3/3] 推送到 GitHub...
git push origin master

echo.
echo ══════════════════════════════════════
echo   ✅ 同步完成！
echo   🌐 网站已自动部署: https://yuzijiang-xianyu.github.io
echo   ⏱  1-2 分钟后生效
echo ══════════════════════════════════════
echo.
pause
