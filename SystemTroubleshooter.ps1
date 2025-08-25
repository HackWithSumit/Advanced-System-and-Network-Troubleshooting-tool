# Advanced System and Network Troubleshooter
# Programmed by: Sumit Ghosh
# Phone: 7076501101
# Email: cybersertex@outlook.com

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create main form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Advanced System & Network Troubleshooter v1.0"
$form.Size = New-Object System.Drawing.Size(600, 500)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedSingle"
$form.MaximizeBox = $false

# Create menu strip
$menuStrip = New-Object System.Windows.Forms.MenuStrip
$helpMenu = New-Object System.Windows.Forms.ToolStripMenuItem
$helpMenu.Text = "Help"
$aboutMenuItem = New-Object System.Windows.Forms.ToolStripMenuItem
$aboutMenuItem.Text = "About"
$helpMenu.DropDownItems.Add($aboutMenuItem)
$menuStrip.Items.Add($helpMenu)
$form.Controls.Add($menuStrip)

# About dialog function
$aboutMenuItem.Add_Click({
    $aboutForm = New-Object System.Windows.Forms.Form
    $aboutForm.Text = "About"
    $aboutForm.Size = New-Object System.Drawing.Size(400, 300)
    $aboutForm.StartPosition = "CenterParent"
    $aboutForm.FormBorderStyle = "FixedDialog"
    $aboutForm.MaximizeBox = $false
    $aboutForm.MinimizeBox = $false

    $aboutLabel = New-Object System.Windows.Forms.Label
    $aboutLabel.Text = @"
Advanced System & Network Troubleshooter v1.0

A comprehensive GUI tool for system and network diagnostics

Programmed by: Sumit Ghosh
Phone: 7076501101
Email: cybersertex@outlook.com

Features:
- Network Diagnostics
- System Information
- Performance Monitoring
- Registry Tools
- Service Management
- Event Log Analysis
- Disk Cleanup
- System File Checker

© 2024 All Rights Reserved
"@
    $aboutLabel.Location = New-Object System.Drawing.Point(20, 20)
    $aboutLabel.Size = New-Object System.Drawing.Size(350, 200)
    $aboutLabel.Font = New-Object System.Drawing.Font("Arial", 10)
    
    $okButton = New-Object System.Windows.Forms.Button
    $okButton.Text = "OK"
    $okButton.Location = New-Object System.Drawing.Point(160, 230)
    $okButton.Size = New-Object System.Drawing.Size(75, 23)
    $okButton.Add_Click({ $aboutForm.Close() })

    $aboutForm.Controls.Add($aboutLabel)
    $aboutForm.Controls.Add($okButton)
    $aboutForm.ShowDialog()
})

# Function to run scripts
function RunScript($scriptPath, $scriptType) {
    try {
        if ($scriptType -eq "batch") {
            Start-Process "cmd.exe" -ArgumentList "/c `"$scriptPath`"" -WindowStyle Normal
        } elseif ($scriptType -eq "powershell") {
            Start-Process "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File `"$scriptPath`"" -WindowStyle Normal
        }
    } catch {
        [System.Windows.Forms.MessageBox]::Show("Error running script: $($_.Exception.Message)", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
}

# Create title label
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "Advanced System & Network Troubleshooter"
$titleLabel.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = [System.Drawing.Color]::DarkBlue
$titleLabel.Location = New-Object System.Drawing.Point(50, 40)
$titleLabel.Size = New-Object System.Drawing.Size(500, 30)
$titleLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$form.Controls.Add($titleLabel)

# Create buttons with improved layout
$buttonWidth = 180
$buttonHeight = 35
$buttonSpacing = 10
$startX = 50
$startY = 90

# Network Troubleshooting Section
$networkLabel = New-Object System.Windows.Forms.Label
$networkLabel.Text = "Network Diagnostics"
$networkLabel.Font = New-Object System.Drawing.Font("Arial", 11, [System.Drawing.FontStyle]::Bold)
$networkLabel.Location = New-Object System.Drawing.Point($startX, $startY)
$networkLabel.Size = New-Object System.Drawing.Size(200, 25)
$form.Controls.Add($networkLabel)

# Network buttons
$btnPing = New-Object System.Windows.Forms.Button
$btnPing.Text = "Ping Test"
$btnPing.Location = New-Object System.Drawing.Point($startX, ($startY + 30))
$btnPing.Size = New-Object System.Drawing.Size($buttonWidth, $buttonHeight)
$btnPing.Add_Click({ RunScript ".\scripts\ping_test.bat" "batch" })
$form.Controls.Add($btnPing)

$btnIPConfig = New-Object System.Windows.Forms.Button
$btnIPConfig.Text = "IP Configuration"
$btnIPConfig.Location = New-Object System.Drawing.Point(($startX + $buttonWidth + $buttonSpacing), ($startY + 30))
$btnIPConfig.Size = New-Object System.Drawing.Size($buttonWidth, $buttonHeight)
$btnIPConfig.Add_Click({ RunScript ".\scripts\ipconfig_info.bat" "batch" })
$form.Controls.Add($btnIPConfig)

$btnNetStat = New-Object System.Windows.Forms.Button
$btnNetStat.Text = "Network Statistics"
$btnNetStat.Location = New-Object System.Drawing.Point(($startX + 2*($buttonWidth + $buttonSpacing)), ($startY + 30))
$btnNetStat.Size = New-Object System.Drawing.Size($buttonWidth, $buttonHeight)
$btnNetStat.Add_Click({ RunScript ".\scripts\netstat_info.bat" "batch" })
$form.Controls.Add($btnNetStat)

# System Information Section
$systemLabel = New-Object System.Windows.Forms.Label
$systemLabel.Text = "System Information"
$systemLabel.Font = New-Object System.Drawing.Font("Arial", 11, [System.Drawing.FontStyle]::Bold)
$systemLabel.Location = New-Object System.Drawing.Point($startX, ($startY + 90))
$systemLabel.Size = New-Object System.Drawing.Size(200, 25)
$form.Controls.Add($systemLabel)

# System buttons
$btnSystemInfo = New-Object System.Windows.Forms.Button
$btnSystemInfo.Text = "System Information"
$btnSystemInfo.Location = New-Object System.Drawing.Point($startX, ($startY + 120))
$btnSystemInfo.Size = New-Object System.Drawing.Size($buttonWidth, $buttonHeight)
$btnSystemInfo.Add_Click({ RunScript ".\scripts\system_info.ps1" "powershell" })
$form.Controls.Add($btnSystemInfo)

$btnDiskInfo = New-Object System.Windows.Forms.Button
$btnDiskInfo.Text = "Disk Information"
$btnDiskInfo.Location = New-Object System.Drawing.Point(($startX + $buttonWidth + $buttonSpacing), ($startY + 120))
$btnDiskInfo.Size = New-Object System.Drawing.Size($buttonWidth, $buttonHeight)
$btnDiskInfo.Add_Click({ RunScript ".\scripts\disk_info.ps1" "powershell" })
$form.Controls.Add($btnDiskInfo)

$btnProcesses = New-Object System.Windows.Forms.Button
$btnProcesses.Text = "Running Processes"
$btnProcesses.Location = New-Object System.Drawing.Point(($startX + 2*($buttonWidth + $buttonSpacing)), ($startY + 120))
$btnProcesses.Size = New-Object System.Drawing.Size($buttonWidth, $buttonHeight)
$btnProcesses.Add_Click({ RunScript ".\scripts\processes.ps1" "powershell" })
$form.Controls.Add($btnProcesses)

# System Maintenance Section
$maintenanceLabel = New-Object System.Windows.Forms.Label
$maintenanceLabel.Text = "System Maintenance"
$maintenanceLabel.Font = New-Object System.Drawing.Font("Arial", 11, [System.Drawing.FontStyle]::Bold)
$maintenanceLabel.Location = New-Object System.Drawing.Point($startX, ($startY + 180))
$maintenanceLabel.Size = New-Object System.Drawing.Size(200, 25)
$form.Controls.Add($maintenanceLabel)

# Maintenance buttons
$btnSFC = New-Object System.Windows.Forms.Button
$btnSFC.Text = "System File Check"
$btnSFC.Location = New-Object System.Drawing.Point($startX, ($startY + 210))
$btnSFC.Size = New-Object System.Drawing.Size($buttonWidth, $buttonHeight)
$btnSFC.Add_Click({ RunScript ".\scripts\sfc_scan.bat" "batch" })
$form.Controls.Add($btnSFC)

$btnEventLogs = New-Object System.Windows.Forms.Button
$btnEventLogs.Text = "Event Logs"
$btnEventLogs.Location = New-Object System.Drawing.Point(($startX + $buttonWidth + $buttonSpacing), ($startY + 210))
$btnEventLogs.Size = New-Object System.Drawing.Size($buttonWidth, $buttonHeight)
$btnEventLogs.Add_Click({ RunScript ".\scripts\event_logs.ps1" "powershell" })
$form.Controls.Add($btnEventLogs)

$btnServices = New-Object System.Windows.Forms.Button
$btnServices.Text = "Services Management"
$btnServices.Location = New-Object System.Drawing.Point(($startX + 2*($buttonWidth + $buttonSpacing)), ($startY + 210))
$btnServices.Size = New-Object System.Drawing.Size($buttonWidth, $buttonHeight)
$btnServices.Add_Click({ RunScript ".\scripts\services.ps1" "powershell" })
$form.Controls.Add($btnServices)

# Performance Section
$performanceLabel = New-Object System.Windows.Forms.Label
$performanceLabel.Text = "Performance Monitoring"
$performanceLabel.Font = New-Object System.Drawing.Font("Arial", 11, [System.Drawing.FontStyle]::Bold)
$performanceLabel.Location = New-Object System.Drawing.Point($startX, ($startY + 270))
$performanceLabel.Size = New-Object System.Drawing.Size(200, 25)
$form.Controls.Add($performanceLabel)

# Performance buttons
$btnTaskMgr = New-Object System.Windows.Forms.Button
$btnTaskMgr.Text = "Task Manager"
$btnTaskMgr.Location = New-Object System.Drawing.Point($startX, ($startY + 300))
$btnTaskMgr.Size = New-Object System.Drawing.Size($buttonWidth, $buttonHeight)
$btnTaskMgr.Add_Click({ Start-Process "taskmgr.exe" })
$form.Controls.Add($btnTaskMgr)

$btnPerfMon = New-Object System.Windows.Forms.Button
$btnPerfMon.Text = "Performance Monitor"
$btnPerfMon.Location = New-Object System.Drawing.Point(($startX + $buttonWidth + $buttonSpacing), ($startY + 300))
$btnPerfMon.Size = New-Object System.Drawing.Size($buttonWidth, $buttonHeight)
$btnPerfMon.Add_Click({ Start-Process "perfmon.exe" })
$form.Controls.Add($btnPerfMon)

$btnResources = New-Object System.Windows.Forms.Button
$btnResources.Text = "Resource Monitor"
$btnResources.Location = New-Object System.Drawing.Point(($startX + 2*($buttonWidth + $buttonSpacing)), ($startY + 300))
$btnResources.Size = New-Object System.Drawing.Size($buttonWidth, $buttonHeight)
$btnResources.Add_Click({ Start-Process "resmon.exe" })
$form.Controls.Add($btnResources)

# Exit button
$btnExit = New-Object System.Windows.Forms.Button
$btnExit.Text = "Exit"
$btnExit.BackColor = [System.Drawing.Color]::LightCoral
$btnExit.Location = New-Object System.Drawing.Point(250, 420)
$btnExit.Size = New-Object System.Drawing.Size(100, 30)
$btnExit.Add_Click({ $form.Close() })
$form.Controls.Add($btnExit)

# Show the form
$form.Add_Shown({$form.Activate()})
[void] $form.ShowDialog()
