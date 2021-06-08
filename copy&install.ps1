$file = '%%FILE PATH%%'
$computernames = Get-Content '%%COMPUTERNAMES%%'
foreach ($computer in $computernames) {
                $computerName = $computer
                $session = New-PSSession -ComputerName $computerName -Credential %%USERNAME%%
                Copy-Item -Path $file -ToSession $session -Destination '%%WHERE TO COPY%%'
                Invoke-Command -Session $session -ScriptBlock {           
                               Start-Process %%WHERE TO COPY%% -ArgumentList '/s' -Wait
                }
                echo $computer upgraded
}
Remove-PSSession $session
