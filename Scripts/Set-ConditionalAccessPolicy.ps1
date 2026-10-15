Import-Module Microsoft.Graph.Identity.SignIns 
Connect-MgGraph -Scopes "Policy.Read.All"
Get-MgIdentityConditionalAccessPolicy | Select-Object DisplayName, State, CreatedDateTime