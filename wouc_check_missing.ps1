# what: lists missing windows updates, compares to offline repo
# based on https://msdn.microsoft.com/en-us/library/windows/desktop/aa387290(v=vs.85).aspx
# caution: script needs admin-rights

# when: manual/scheduled, especially after patch tuesdays
# who: github.com/inbi

# dependencies: needs wsusscn2.cab in c:\temp as you've already figured out
# - located at [wsusofflinedir]\client\wsus
# - downloadable at http://go.microsoft.com/fwlink/?LinkId=76054

# uncomment to download the file via script:
# iwr http://go.microsoft.com/fwlink/?LinkId=76054 -outfile c:\temp\wsusscn2.cab

$UpdateSession = New-Object -ComObject "Microsoft.Update.Session"
$UpdateSearcher = $UpdateSession.CreateUpdateSearcher()
$UpdateServiceManager = New-Object -ComObject "Microsoft.Update.ServiceManager"
$UpdateService = $UpdateServiceManager.AddScanPackageService("Offline Sync Service", "c:\temp\wsusscn2.cab")

write "Searching for Updates. Please wait..."
$UpdateSearcher.ServerSelection = 3
$UpdateSearcher.ServiceID = $UpdateService.ServiceID
$SearchResult = $UpdateSearcher.Search("IsInstalled=0")
$Updates = $SearchResult.Updates

write "List of applicable items on the machine when using wsusscn2.cab:"
$Updates | select title, type, ismandatory, maxdownloadsize, lastdeploymentchangetime | fl

# use e.g. "$Updates | tee \\server1\logs\mua_$env:computername.log" to redirect output to file
