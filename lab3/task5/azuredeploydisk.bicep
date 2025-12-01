@description('Name of the managed disk')
param managedDiskName string = 'az104-disk5'

@description('Location for the disk')
param location string = resourceGroup().location

@description('Size of the disk in GB')
param diskSizeinGiB int = 32

@description('Storage account type for the disk')
@allowed([
  'Standard_LRS'
  'StandardSSD_LRS'
  'Premium_LRS'
])
param diskSku string = 'StandardSSD_LRS'

resource managedDisk 'Microsoft.Compute/disks@2023-10-02' = {
  name: managedDiskName
  location: location
  sku: {
    name: diskSku
  }
  properties: {
    creationData: {
      createOption: 'Empty'
    }
    diskSizeGB: diskSizeinGiB
  }
  tags: {
    environment: 'lab'
    task: 'task5'
  }
}

output diskId string = managedDisk.id
output diskName string = managedDisk.name
output diskSizeGB int = managedDisk.properties.diskSizeGB