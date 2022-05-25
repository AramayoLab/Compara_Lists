# **<p align="center">Compara_Lists</p>**
## _<p align="center">**AramayoLab**</p>_

<div align="center">

| Author          | Work Email        | Personal Email      |
| --              | --                | --                  |
| Rodolfo Aramayo | raramayo@tamu.edu | rodolfo@aramayo.org |

</div>

## Motivation

```
My main motivation for this script was reproducibility and replicability, when comparing list of
IDs. Mainly, I wanted to make sure that students evaluating different files used the same set of
commands, thus eliminating any possibility of error.
```

## Documentation

```
ARAMAYO_LAB

This program is free software: you can redistribute it and/or modify it under the terms of the GNU
General Public License as published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without
even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not,
see <https://www.gnu.org/licenses/>.

SCRIPT_NAME:                       Compara_Lists_v01.sh
SCRIPT_VERSION:                    v1.0.0

USAGE: ./Compara_Lists_v01.sh
       -a List A                   # REQUIRED input (e.g., listA)
       -A List A Name              # OPTIONAL (e.g., listA)
       -b List B                   # REQUIRED input (e.g., listB)
       -B List B Name              # OPTIONAL (e.g., listB)

TYPICAL COMMAND:                   Compara_Lists_v1.0.1.sh -a listA -A listA -b listB -B listB

INPUT01:          -a FLAG          REQUIRED input  (e.g., listA)
INPUT01_DEFAULT:                   No Default. ListA file must be provided
INPUT01_FORMAT:                    Text file
INPUT01_NOTES:                     Single column text file

INPUT02:          -A FLAG          OPTIONAL (ListA_Label)
INPUT02_DEFAULT:                   listA
INPUT02_FORMAT:                    Text
INPUT02_NOTES:                     Optional

INPUT03:          -b FLAG          REQUIRED input  (e.g., listB)
INPUT03_DEFAULT:                   No Default. ListB file must be provided
INPUT03_FORMAT:                    Text file
INPUT03_NOTES:                     Single column text file

INPUT04:          -B FLAG          OPTIONAL (ListB_Lable)
INPUT04_DEFAULT:                   listB
INPUT04_FORMAT:                    Text
INPUT04_NOTES:                     Optional

DEPENDENCIES:                      GNU COREUTILS Required (https://www.gnu.org/software/coreutils/)

Author:                            Rodolfo Aramayo
WORK_EMAIL:                        raramayo@tamu.edu
PERSONAL_EMAIL:                    rodolfo@aramayo.org
```

## Development/Testing Environment:

```
Distributor ID:       Ubuntu
Description:  Ubuntu 20.04.4 LTS
Release:      20.04
Codename:     focal
```

## Required Script Dependencies:
### GNU COREUTILS (https://www.gnu.org/software/coreutils/)
#### Tested With Version Numbers:
#### 8.30

```
comm (GNU coreutils) 8.30
Copyright (C) 2018 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Richard M. Stallman and David MacKenzie.
```

##### 8.32

```
comm (GNU coreutils) 8.32
Copyright (C) 2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Richard M. Stallman and David MacKenzie.
```
