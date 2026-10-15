Import-Module Microsoft.Graph.DeviceManagement

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

$Devices = Get-MgDeviceManagementManagedDevice -Filter "contains(operatingSystem, 'Windows')"

Write-Host "Found $($Devices.Count) devices. Starting LAPS password rotation..." -ForegroundColor Cyan

foreach ($Device in $Devices) {
    try {
        $Uri = "https://graph.microsoft.com/beta/deviceManagement/managedDevices/$($Device.Id)/rotateLocalAdminPassword"
        Invoke-MgGraphRequest -Method POST -Uri $Uri
        Write-Host "Device Found: $($Device.DeviceName) ($($Device.Id))" -ForegroundColor Green
        Write-Host "Password Rotation triggered successfully!" -ForegroundColor Green
    }
    catch {
        Write-Host "Failed to rotate password for $($Device.DeviceName): $_" -ForegroundColor Red
    }
}