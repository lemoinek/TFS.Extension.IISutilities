Param(
  [string]$action,
  [string]$Computer ,
  [string]$Names ,
  [string]$adminUserName , 
  [string]$adminPassword 

)

$action = $action -replace ' ','-'

if (![string]::IsNullOrWhiteSpace($adminUserName)){
    $secpasswd = ConvertTo-SecureString $adminPassword -AsPlainText -Force
    $credential = New-Object -typename System.Management.Automation.PSCredential -ArgumentList $adminUserName,$secpasswd

    $Names.Split(";") | ForEach-Object -Process {
        echo "$($action) $($_)"
        Invoke-Command -ComputerName $Computer -Credential $credential -ScriptBlock {
            param($service,$action)
            Get-Module WebAdministration
            Invoke-Expression  "$($action) -Name '$($service)'"
        } -ArgumentList $_,$action  
    }

}
else {
    $Names.Split(";") | ForEach-Object -Process {
        echo "$($action) $($_)"
        Invoke-Command -ComputerName $Computer -ScriptBlock {
            param($service,$action)
            Get-Module WebAdministration
            Invoke-Expression  "$($action) -Name '$($service)'"
        } -ArgumentList $_,$action  
    }
}




