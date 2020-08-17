## powershell
Login-AzAccount
$subscriptionId = 'xxxx-xxxxx-xxxxx'
Connect-AzAccount -Subscription $subscriptionId
$sub = Get-AzSubscription -SubscriptionId $subscriptionId
$spnName = "flkelly-testinfggds1"
$sp1 = New-AzADServicePrincipal -DisplayName $spnName -Scope /subscriptions/$subscriptionId -Role Contributor
$clientsec = [System.Net.NetworkCredential]::new("", $sp1.Secret).Password

##read out variabes from $sp
$env:ARM_SUBSCRIPTION_ID = $subscriptionId
$env:ARM_CLIENT_ID = $sp1.ApplicationId.Guid
$env:ARM_CLIENT_SECRET = $clientsec
$env:ARM_TENANT_ID = $sub.TenantID

##Clean up time
##Get-AzADServicePrincipal -DisplayName $spnName | Remove-AzADServicePrincipal