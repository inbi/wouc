rem what: disables infamous tasks and services (win 8.1)
rem who: github.com/inbi
rem please run with adminstrative privileges

sc stop DiagTrack
sc config DiagTrack start= disabled
rem sc delete DiagTrack
echo "" > %allusersprofile%\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl

sc stop dmwappushservice
sc config dmwappushservice start= disabled
rem sc delete dmwappushservice

sc stop HomeGroupListener
sc config HomeGroupListener start= disabled
sc stop HomeGroupProvider
sc config HomeGroupProvider start= disabled

sc stop WMPNetworkSvc
sc config WMPNetworkSvc start= disabled

schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM"
schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask"
schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader"
schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"

schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\AitAgent"
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater"
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\StartupAppTask"

rem schtasks /change /disable /tn "\Microsoft\Windows\Removal Tools\MRT_HB"
schtasks /change /disable /tn "\Microsoft\Windows\Maintenance\WinSAT"
schtasks /change /disable /tn "\Microsoft\Windows\Autochk\Proxy"
schtasks /change /disable /tn "\Microsoft\Windows\Windows Media Sharing\UpdateLibrary"
schtasks /change /disable /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"

schtasks /change /disable /tn "\Microsoft\Windows\Wininet\CacheTask"
schtasks /change /disable /tn "\Microsoft\Windows\WDI\ResolutionHost"

schtasks /change /disable /tn "\Microsoft\Windows\SkyDrive\Idle Sync Maintenance Task"
schtasks /change /disable /tn "\Microsoft\Windows\SkyDrive\Routine Maintenance Task"

pause
