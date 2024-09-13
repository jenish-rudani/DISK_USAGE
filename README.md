# DISK SPACE ANALYZER WINDOWS

## Overview

ListTopLevelDirectorySizes is a PowerShell script that calculates and displays the sizes of immediate subdirectories in a given path. It provides a quick and easy way to understand space usage across top-level folders in a specified directory.

## Features

- Recursively calculates the size of each subdirectory
- Displays only top-level directory sizes
- Sorts directories by size in descending order
- Provides a total size of all directories
- Easy-to-use command-line interface

## Prerequisites

- PowerShell V3 or higher

## Installation

1. Clone this repository or download the `ListTopLevelDirectorySizes.ps1` file.
2. Ensure you have PowerShell V3 or higher installed on your system.

## Usage

Run the script from PowerShell, providing the target path as an argument:

```powershell
.\ListTopLevelDirectorySizes.ps1 -targetPath "C:\Path\To\Your\Directory"
```

### Examples

1. Analyze the Documents folder:
   ```powershell
   .\ListTopLevelDirectorySizes.ps1 -targetPath "C:\Users\YourUsername\Documents"
   ```

2. Analyze a Projects folder on the D drive:
   ```powershell
   .\ListTopLevelDirectorySizes.ps1 -targetPath "D:\Projects"
   ```

## Output

The script will output a list of directories sorted by size in descending order, followed by the total size of all directories. For example:

```
   1500.50 MB  C:\Users\YourUsername\Documents\LargeFolder
    750.25 MB  C:\Users\YourUsername\Documents\MediumFolder
    250.75 MB  C:\Users\YourUsername\Documents\SmallFolder

Total size of all directories: 2.44 GB
```

## Help

To view the help information and usage examples, run:

```powershell
Get-Help .\ListTopLevelDirectorySizes.ps1
```

## License

This project is licensed under the MIT License.

## Author

JENISH RUDANI

## Version

1.0

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Copyright

(c) 2024 RudaniLLC