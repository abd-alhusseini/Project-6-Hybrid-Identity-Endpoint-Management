# Sync Autopilot Devices
Import-Module Microsoft.Graph.DeviceManagement.Enrollment
Connect-MgGraph -Scopes "DeviceManagementServiceConfig.ReadWrite.All"
Get-MgDeviceManagementWindowsAutopilotDeviceIdentity