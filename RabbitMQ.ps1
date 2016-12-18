$script:api = "http://localhost:15672/api"

function Get-RabbitMQCredential {
    param ([string]$username, [securestring]$password)
    New-Object System.Management.Automation.PSCredential -ArgumentList $username, $password
}

function Invoke-RabbitMQApi {
    param ([pscredential]$cred, [string]$resource)    
    $url = "$script:api/$resource"
    Invoke-RestMethod -Uri $url -Credential $cred
}
