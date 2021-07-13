(Get-Content ".\Project+\BOOST.txt") -replace '#.include Source/Extras/Console.asm', '.include Source/Extras/Console.asm' | Out-File -encoding ASCII ".\Project+\BOOST.txt"
Rename-Item -Path ".\Project+\GCTRM-Convert.bat" -NewName "GCTRM-Convert1.bat"
Get-Content ".\Project+\GCTRM-Convert1.bat" | Where-Object {$_ -notmatch 'NET'} | Set-Content ".\Project+\GCTRM-Convert.bat"
Remove-Item ".\Project+\GCTRM-Convert1.bat"