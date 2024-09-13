<#
.SYNOPSIS
Lists the sizes of top-level directories in a specified path.

.DESCRIPTION
This script calculates and displays the sizes of immediate subdirectories
in a given path. It recursively calculates the size of each subdirectory
but only displays the top-level results. The script sorts the directories
by size in descending order and provides a total size at the end.

.PARAMETER targetPath
The path to the directory you want to analyze. This parameter is mandatory.

.EXAMPLE
.\ListTopLevelDirectorySizes.ps1 -targetPath "C:\Users\YourUsername\Documents"
This will list the sizes of all immediate subdirectories in the Documents folder.

.EXAMPLE
.\ListTopLevelDirectorySizes.ps1 -targetPath "D:\Projects"
This will list the sizes of all immediate subdirectories in the Projects folder on the D drive.

.NOTES
File Name      : ListTopLevelDirectorySizes.ps1
Author         : JENISH RUDANI
Prerequisite   : PowerShell V3 or higher
Copyright      : (c) 2024 RudaniLLC
License        : MIT
Version        : 1.0
#>

param (
    [Parameter(Mandatory=$true, HelpMessage="Enter the path to the directory you want to analyze")]
    [string]$targetPath
)

# Check if the path exists
if (-not (Test-Path -Path $targetPath)) {
    Write-Error "The specified path does not exist: $targetPath"
    exit 1
}

# Function to get directory size recursively
function Get-DirectorySize {
    param (
        [string]$path
    )
    $size = (Get-ChildItem -Path $path -Recurse -File | Measure-Object -Property Length -Sum).Sum
    return $size
}

# Get all immediate subdirectories
$directories = Get-ChildItem -Path $targetPath -Directory

# Calculate and store sizes
$directorySizes = $directories | ForEach-Object {
    $size = Get-DirectorySize -path $_.FullName
    [PSCustomObject]@{
        Path = $_.FullName
        SizeInMB = [math]::Round($size / 1MB, 2)
    }
}

# Sort and display results
$directorySizes | Sort-Object -Property SizeInMB -Descending | ForEach-Object {
    Write-Output ("{0,10:N2} MB  {1}" -f $_.SizeInMB, $_.Path)
}

# Calculate and display total size
$totalSize = ($directorySizes | Measure-Object -Property SizeInMB -Sum).Sum
Write-Host "`nTotal size of all directories: $([math]::Round($totalSize / 1024, 2)) GB"

# Display usage information if no arguments are provided
if ($MyInvocation.BoundParameters.Count -eq 0) {
    Get-Help $MyInvocation.MyCommand.Path
}