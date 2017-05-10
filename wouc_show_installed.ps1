# what: lists installed windows updates (via com)
# who: github.com/inbi

$Session = New-Object -ComObject "Microsoft.Update.Session"
$Searcher = $Session.CreateUpdateSearcher()
$historyCount = $Searcher.GetTotalHistoryCount()

$Searcher.QueryHistory(0, $historyCount) | Select-Object date, title | sort date -descending | ft -autosize
# add "| tee c:\temp\output.log" to redirect output to file

# alternatives:
# [PS] Get-Hotfix
# [CMD] wmic qfe list brief
