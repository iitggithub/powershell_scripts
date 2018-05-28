# This script adds a user to the local administrators group
# provided that their username forms part of the computer 
# name. Executed as a post WDS task, we can get the computer
# out the door a little quicker.

$username     = $env:username
$computerName = $env:computername
$domain       = 'MYDOMAIN'
$group        = [ADSI]"WinNT://$computerName/Administrators,group"

# Check the username forms part of the computer name
if ($computerName -contains $username) {
  Write-Host "Adding $username to Administrators group..."

  # Add the domain user as a member of the group
  $group.Add("WinNT://$domain/$username")
}