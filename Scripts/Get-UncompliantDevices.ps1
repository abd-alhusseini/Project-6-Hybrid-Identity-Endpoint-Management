Import-Module Microsoft.Graph.DeviceManagement
Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"
Get-MgDeviceManagementManagedDevice | Select-Object DeviceName, UserPrincipalName, OperatingSystem, ComplianceState | Sort-Object ComplianceState