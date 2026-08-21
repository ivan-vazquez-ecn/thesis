# Set error handling to stop on failures
$ErrorActionPreference = "Stop"

Write-Host "==> [1/4] Running LuaLaTeX (Initial Pass)..." -ForegroundColor Cyan
lualatex --interaction=batchmode --synctex=1 main.tex

Write-Host "==> [2/4] Running Biber..." -ForegroundColor Cyan
biber --quiet main

Write-Host "==> [3/4] Running LuaLaTeX (Resolving Citations)..." -ForegroundColor Cyan
lualatex --interaction=batchmode --synctex=1 main.tex

Write-Host "==> [4/4] Running LuaLaTeX (Finalizing References & TOC)..." -ForegroundColor Cyan
lualatex --interaction=batchmode --synctex=1 main.tex

Write-Host "==> Build complete: main.pdf is up to date!" -ForegroundColor Green