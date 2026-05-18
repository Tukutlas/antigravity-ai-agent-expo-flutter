# Antigravity AI Agents - Global Installation Script for Windows
# Version: 2.4
# Description: Installs agents and workflows globally for all Antigravity AI projects

Write-Host ""
Write-Host "🤖 Antigravity AI Agents - Global Installation" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

# Check if running from correct directory
if (-not (Test-Path ".agent\agents") -or -not (Test-Path ".agent\workflows")) {
    Write-Host "❌ Error: Please run this script from the antigravity-ai-agent-expo-flutter directory" -ForegroundColor Red
    Write-Host "   Current directory: $(Get-Location)" -ForegroundColor Yellow
    Write-Host ""
    exit 1
}

# Check if Antigravity directory exists
$antigravityDir = "$env:USERPROFILE\.gemini\antigravity"
if (-not (Test-Path "$env:USERPROFILE\.gemini")) {
    Write-Host "⚠️  Antigravity not found at: $env:USERPROFILE\.gemini" -ForegroundColor Yellow
    Write-Host "   Please make sure Antigravity AI is installed." -ForegroundColor Yellow
    Write-Host ""
    $createAnyway = Read-Host "Create directories anyway? (Y/N)"
    if ($createAnyway -ne 'Y' -and $createAnyway -ne 'y') {
        Write-Host "❌ Installation cancelled." -ForegroundColor Red
        exit 1
    }
}

# Create directories if they don't exist
$agentsDir = "$antigravityDir\global_agents"
$workflowsDir = "$antigravityDir\global_workflows"

Write-Host "📁 Creating directories..." -ForegroundColor Cyan
New-Item -ItemType Directory -Force -Path $agentsDir | Out-Null
New-Item -ItemType Directory -Force -Path $workflowsDir | Out-Null
Write-Host "   ✓ $agentsDir" -ForegroundColor Green
Write-Host "   ✓ $workflowsDir" -ForegroundColor Green
Write-Host ""

# Count files
$agentFiles = Get-ChildItem -Path ".agent\agents\*.md" -File
$workflowFiles = Get-ChildItem -Path ".agent\workflows\*.md" -File

Write-Host "📦 Files to install:" -ForegroundColor Cyan
Write-Host "   - Agents: $($agentFiles.Count) files" -ForegroundColor White
foreach ($file in $agentFiles) {
    Write-Host "     • $($file.Name)" -ForegroundColor Gray
}
Write-Host ""
Write-Host "   - Workflows: $($workflowFiles.Count) files" -ForegroundColor White
foreach ($file in $workflowFiles) {
    Write-Host "     • $($file.Name)" -ForegroundColor Gray
}
Write-Host ""

# Check if files already exist
$existingAgents = Get-ChildItem -Path $agentsDir -Filter "*.md" -ErrorAction SilentlyContinue
$existingWorkflows = Get-ChildItem -Path $workflowsDir -Filter "*.md" -ErrorAction SilentlyContinue

if ($existingAgents.Count -gt 0 -or $existingWorkflows.Count -gt 0) {
    Write-Host "⚠️  Warning: Existing files will be overwritten!" -ForegroundColor Yellow
    Write-Host "   Existing agents: $($existingAgents.Count)" -ForegroundColor Yellow
    Write-Host "   Existing workflows: $($existingWorkflows.Count)" -ForegroundColor Yellow
    Write-Host ""
}

# Ask for confirmation
$confirmation = Read-Host "Continue with installation? (Y/N)"
if ($confirmation -ne 'Y' -and $confirmation -ne 'y') {
    Write-Host ""
    Write-Host "❌ Installation cancelled." -ForegroundColor Red
    Write-Host ""
    exit 0
}

Write-Host ""
Write-Host "🚀 Starting installation..." -ForegroundColor Cyan
Write-Host ""

# Copy agents
Write-Host "📋 Installing agents..." -ForegroundColor Cyan
$copiedAgents = 0
foreach ($file in $agentFiles) {
    Copy-Item -Path $file.FullName -Destination $agentsDir -Force
    Write-Host "   ✓ $($file.Name)" -ForegroundColor Green
    $copiedAgents++
}
Write-Host "   Installed $copiedAgents agents" -ForegroundColor Green
Write-Host ""

# Copy workflows
Write-Host "🔄 Installing workflows..." -ForegroundColor Cyan
$copiedWorkflows = 0
foreach ($file in $workflowFiles) {
    Copy-Item -Path $file.FullName -Destination $workflowsDir -Force
    Write-Host "   ✓ $($file.Name)" -ForegroundColor Green
    $copiedWorkflows++
}
Write-Host "   Installed $copiedWorkflows workflows" -ForegroundColor Green
Write-Host ""

# Copy rules (optional)
if (Test-Path "rules.md") {
    Write-Host "📜 Installing global rules..." -ForegroundColor Cyan
    Copy-Item -Path "rules.md" -Destination "$env:USERPROFILE\.gemini\GEMINI.md" -Force
    Write-Host "   ✓ GEMINI.md" -ForegroundColor Green
    Write-Host ""
}

# Summary
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "🎉 Installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "📊 Summary:" -ForegroundColor Cyan
Write-Host "   ✓ $copiedAgents agents installed" -ForegroundColor White
Write-Host "   ✓ $copiedWorkflows workflows installed" -ForegroundColor White
Write-Host "   ✓ Global rules installed" -ForegroundColor White
Write-Host ""
Write-Host "📍 Installation location:" -ForegroundColor Cyan
Write-Host "   $antigravityDir" -ForegroundColor White
Write-Host ""
Write-Host "🚀 Next steps:" -ForegroundColor Yellow
Write-Host "   1. Open any project in Antigravity AI" -ForegroundColor White
Write-Host "   2. Type '/' to see available workflows" -ForegroundColor White
Write-Host "   3. Try: /feature-flutter Create a counter widget" -ForegroundColor White
Write-Host ""
Write-Host "📚 Available workflows:" -ForegroundColor Cyan
Write-Host "   • /plan-product          - Product discovery & PRD" -ForegroundColor White
Write-Host "   • /feature-flutter       - Full Flutter feature implementation" -ForegroundColor White
Write-Host "   • /feature-reactnative   - Full React Native feature implementation" -ForegroundColor White
Write-Host "   • /review-flutter        - Comprehensive Flutter code review" -ForegroundColor White
Write-Host "   • /review-reactnative    - Comprehensive React Native review" -ForegroundColor White
Write-Host "   • /test-flutter          - Generate Flutter test suite" -ForegroundColor White
Write-Host "   • /test-reactnative      - Generate React Native test suite" -ForegroundColor White
Write-Host "   • /stitch-flutter        - Convert Stitch HTML to Flutter" -ForegroundColor White
Write-Host "   • /stitch-reactnative    - Convert Stitch HTML to React Native" -ForegroundColor White
Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""
