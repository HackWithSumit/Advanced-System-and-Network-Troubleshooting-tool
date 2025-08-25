===============================================
  Advanced System & Network Troubleshooter
                   v1.0
===============================================

Programmed by: Sumit Ghosh
Phone: 7076501101
Email: cybersertex@outlook.com

===============================================
DESCRIPTION
===============================================

This is a comprehensive GUI-based system and network troubleshooting software designed for Windows systems. It provides easy access to various diagnostic tools and system utilities through an intuitive graphical interface.

===============================================
FEATURES
===============================================

Network Diagnostics:
- Ping Test Tool
- IP Configuration Management
- Network Statistics Analysis

System Information:
- Detailed System Information
- Disk Information and Health
- Running Processes Management

System Maintenance:
- System File Checker (SFC)
- Event Log Analysis
- Windows Services Management

Performance Monitoring:
- Task Manager Integration
- Performance Monitor Access
- Resource Monitor Access

===============================================
SYSTEM REQUIREMENTS
===============================================

- Windows 7/8/10/11 (32-bit or 64-bit)
- PowerShell 2.0 or higher
- .NET Framework 3.5 or higher
- Administrator privileges (recommended for full functionality)

===============================================
INSTALLATION
===============================================

1. Extract all files to a folder (e.g., C:\SystemTroubleshooter\)
2. Ensure the following files are present:
   - Launch_SystemTroubleshooter.bat (Main launcher)
   - SystemTroubleshooter.ps1 (Main GUI application)
   - scripts\ folder with all script files

3. File Structure should look like:
   SystemTroubleshooter\
   ├── Launch_SystemTroubleshooter.bat
   ├── SystemTroubleshooter.ps1
   ├── README.txt
   └── scripts\
       ├── ping_test.bat
       ├── ipconfig_info.bat
       ├── netstat_info.bat
       ├── system_info.ps1
       ├── disk_info.ps1
       ├── processes.ps1
       ├── sfc_scan.bat
       ├── event_logs.ps1
       └── services.ps1

===============================================
USAGE
===============================================

Method 1 (Recommended):
- Double-click "Launch_SystemTroubleshooter.bat"
- The GUI application will start automatically

Method 2 (Direct PowerShell):
- Right-click "SystemTroubleshooter.ps1"
- Select "Run with PowerShell"

Method 3 (Command Line):
- Open Command Prompt as Administrator
- Navigate to the application folder
- Run: powershell -ExecutionPolicy Bypass -File "SystemTroubleshooter.ps1"

===============================================
TROUBLESHOOTING
===============================================

If you encounter "execution policy" errors:
1. Open PowerShell as Administrator
2. Run: Set-ExecutionPolicy RemoteSigned
3. Choose Y when prompted
4. Try launching the application again

If scripts don't run properly:
- Ensure you have Administrator privileges
- Check that Windows Defender or antivirus isn't blocking the scripts
- Verify all script files are present in the scripts folder

===============================================
FEATURES OVERVIEW
===============================================

NETWORK DIAGNOSTICS:
- Ping Test: Test connectivity to various hosts
- IP Configuration: View and manage IP settings
- Network Statistics: Analyze network connections and statistics

SYSTEM INFORMATION:
- System Info: Complete hardware and software information
- Disk Info: Disk space, health, and performance data
- Processes: Monitor and manage running processes

SYSTEM MAINTENANCE:
- SFC Scan: System File Checker and DISM tools
- Event Logs: View and analyze Windows event logs
- Services: Manage Windows services

PERFORMANCE MONITORING:
- Direct access to Task Manager
- Performance Monitor integration
- Resource Monitor access

===============================================
ABOUT MENU
===============================================

The application includes an About dialog accessible through:
Help -> About

This displays:
- Software information
- Developer contact details
- Feature overview
- Copyright information

===============================================
EXIT FUNCTION
===============================================

The application includes a prominent Exit button to safely close the program.

===============================================
SUPPORT
===============================================

For support, bug reports, or feature requests:
Email: cybersertex@outlook.com
Phone: 7076501101

===============================================
VERSION HISTORY
===============================================

v1.0 (Initial Release):
- Complete GUI implementation
- Network diagnostic tools
- System information utilities
- Maintenance and monitoring tools
- Comprehensive script collection

===============================================
COPYRIGHT
===============================================

© 2024 Sumit Ghosh. All Rights Reserved.

This software is provided "as is" without warranty of any kind.
Use at your own risk.
