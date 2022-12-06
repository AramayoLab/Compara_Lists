#!/usr/bin/env bash

func_copyright ()
{
    cat <<COPYRIGHT

This program is free software: you can redistribute it and/or modify it under the terms of the GNU
General Public License as published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without
even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not,
see <https://www.gnu.org/licenses/>.

COPYRIGHT
};

func_authors ()
{
    cat <<AUTHORS
Author:                            Rodolfo Aramayo
WORK_EMAIL:                        raramayo@tamu.edu
PERSONAL_EMAIL:                    rodolfo@aramayo.org
AUTHORS
};

func_usage ()
{
    cat <<EOF
########################################################################################################################################################################################################
ARAMAYO_LAB
$(func_copyright)

SCRIPT_NAME:                       $(basename ${0})
SCRIPT_VERSION:                    ${version}

USAGE: $(basename ${0})
       -a List A                   # REQUIRED input (e.g., listA)
       -A List A Name              # OPTIONAL (e.g., listA)
       -b List B                   # REQUIRED input (e.g., listB)
       -B List B Name              # OPTIONAL (e.g., listB)

TYPICAL COMMAND:                   $(basename ${0}) -a listA -A listA -b listB -B listB

INPUT01:          -a FLAG          Name of a single column text file containing records IDs to be compared (e.g., listA)
INPUT01_DEFAULT:                   No Default. ListA file must be provided
INPUT01_FORMAT:                    Single column text file
INPUT01_NOTES:                     Required

INPUT02:          -A FLAG          Name of the listA dataset or listA dataset label
INPUT02_DEFAULT:                   listA
INPUT02_FORMAT:                    Text
INPUT02_NOTES:                     Optional. Label will be used to name the output files

INPUT03:          -b FLAG          Name of a single column text file containing records IDs to be compared (e.g., listB)
INPUT03_DEFAULT:                   No Default. ListB file must be provided
INPUT03_FORMAT:                    Single column text file
INPUT03_NOTES:                     Required

INPUT04:          -B FLAG          Name of the listA dataset or listB dataset label
INPUT04_DEFAULT:                   listB
INPUT04_FORMAT:                    Text
INPUT04_NOTES:                     Optional. Label will be used to name the output files

DEPENDENCIES:                      GNU COREUTILS Required (https://www.gnu.org/software/coreutils/)

$(func_authors)
########################################################################################################################################################################################################
EOF
};

## Defining_Script_Current_Version
version=1.0.2;

## Defining_Script_Initial_Version_Data (date '+DATE:%Y/%m/%d%tTIME:%R')
version_date_initial="DATE:2022/05/26	TIME:09:13";

## Defining_Script_Current_Version_Data (date '+DATE:%Y/%m/%d%tTIME:%R')
version_date_current="DATE:2022/11/30	TIME:18:21";

## Testing_Script_Input
## Is the number of arguments null?
if [[ ${#} -eq 0 ]];
then
    echo -e "\nPlease enter required arguments";
    func_usage;
    exit 1;
fi

while true;
do
    case "$1" in
        -h|--h|-help|--help|-\?|--\?)
            func_usage;
            exit 0;
            ;;
        -v|--v|-version|--version)
            printf "Version: $version %s\n" >&2;
            exit 0;
            ;;
        -a|--a)
            listA="$2";
            ## Checking existence listA file
            if [[ ! -f "${listA}" ]];
            then
                printf '\nWARNNING: The Required listA file is missing\n' >&2;
                func_usage;
                exit 0;
            fi
            shift;
            ;;
        -A|--A)
            nameA="$2";
            if [[ -z "$nameA" ]];
            then
                echo "Please Provide a Valid listA Name";
                func_usage;
                exit 1;
            fi
            shift;
            ;;
        -b|--b)
            listB="$2";
            ## Checking existence listB file
            if [[ ! -f "${listB}" ]];
            then
                printf '\nWARNNING: The Required listB file is missing\n' >&2;
                func_usage;
                exit 0;
            fi
            shift;
            ;;
        -B|--B)
            nameB="$2";
            if [[ -z "$nameB" ]];
            then
                echo "Please Provide a Valid listB Name";
                func_usage;
                exit 1;
            fi
            shift;
            ;;
        -?*)
            printf '\nWARNNING: Unknown Option (ignored): %s\n\n' "$1" >&2;
            func_usage;
            ;;
        :)
            printf '\nWARNING: Invalid Option (ignored): %s\n\n' "$1" >&2;
            func_usage;
            ;;
        \?)
            printf '\nWARNING: Invalid Option (ignored): %s\n\n' "$1" >&2;
            func_usage;
            ;;
        *)  # Should not get here
            break;
            exit 1;
            ;;
    esac
    shift;
done

var_01=${listA};
var_02=${nameA:=ListA};
var_03=${listB};
var_04=${nameB:=ListB};

#Printing terms that are only present in List_A
#_File_001
comm -23 \
     <(awk 'BEGIN{FS=OFS="\t" }{print $1}' ./"$var_01" | sort | uniq | sed '/^$/d') \
     <(awk 'BEGIN{FS=OFS="\t" }{print $1}' ./"$var_03" | sort | uniq | sed '/^$/d') \
     > ./Comparing_"${var_02}"_vs_"${var_04}"_Terms_Only_Present_"$var_02".out;

#Printing terms that are only present in List_B
#_File_002
comm -13 \
     <(awk 'BEGIN{FS=OFS="\t" }{print $1}' ./"$var_01" | sort | uniq | sed '/^$/d') \
     <(awk 'BEGIN{FS=OFS="\t" }{print $1}' ./"$var_03" | sort | uniq | sed '/^$/d') \
     > ./Comparing_"${var_02}"_vs_"${var_04}"_Terms_Only_Present_"$var_04".out;

#Printing terms that are common to both List_A and List_B
#_File_003
comm -12 \
     <(awk 'BEGIN{FS=OFS="\t" }{print $1}' ./"$var_01" | sort | uniq | sed '/^$/d') \
     <(awk 'BEGIN{FS=OFS="\t" }{print $1}' ./"$var_03" | sort | uniq | sed '/^$/d') \
     > ./Comparing_"${var_02}"_vs_"${var_04}"_Terms_Present_"$var_02"_and_"$var_04".out;

exit 0
