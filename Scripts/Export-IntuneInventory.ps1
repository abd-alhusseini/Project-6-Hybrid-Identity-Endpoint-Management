Import-Module Microsoft.Graph.DeviceManagement 
Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"
Get-MgDeviceManagementManagedDevice | Select-Object DeviceName, Model, SerialNumber, OSVersion, ComplianceState | Export-Csv -Path "./IntuneInventory.csv" -NoTypeInformation