#!/bin/bash

# @file Menu
# @brief Function for dynamic menu generation .

# @constants 
declare -r NORMAL="\\033[0;39m"
declare -r CYAN="\\033[1;36m"
declare -r RED="\\033[1;31m"
declare -r YELLOW="\\033[1;33m"
declare -r GREEN="\\033[1;32m"

# @description This function allows to generate a menu from a list 
# of propositions with a quit option. 
#
# @example
#   items=("item1" "item2" "item3")
#   testvar="test"
#   menu::generate "Test introduce sentence" "testvar" 1 0 "${items[@]}" 
#
# @arg $1 string The introduction sentence to display before the menu.
# @arg $2 string Variable name to pass the choosen option in reference.
# @arg $3 int If 0, the menu return the index of the proposition chosen,
# else if 1, the menu return the value of the proposition chosen.
# @arg $4 int If 0, the menu display a quit option at the end of the
# propositions, else if 1, the menu only displays the values of te propositions.
# @arg $5 array Array of propositions.
#
# @exitcode 0 If successful.
# @exitcode 2 Function missing arguments.
#
# @stdout The menu generated dynamically.
function menu::generate()
{
    [[ $# -lt 4 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2
    declare introduction="$1"
    declare varRef=$2
    declare index=$3
    declare quit=$4
    declare -a propositions=("${@:5:$#}")
    propositionsLengthTmp=${#propositions[@]}
    if [[ "$quit" -eq 0 ]] ; then
        propositions+=( "Quit" )
        propositionsLength=${#propositions[@]}
    else 
        propositionsLength=$propositionsLengthTmp
    fi
    answer=0

    while [[ ! ($answer =~ (^[1-$propositionsLength])$) ]]
    do
        echo -e "$YELLOW $introduction $NORMAL"
        i=1
        for proposition in "${propositions[@]}"
        do
            echo -e "\n\t $GREEN $i $NORMAL- $proposition"
            (( i++ ))
        done
        echo -e ""
        read -rp "Your choice : " answer

        case "$quit" in
        0)
            case "$answer" in
            [1-$propositionsLengthTmp])
                break
                ;;
            [$propositionsLength]) return 1 ;;
            *)
                clear
                echo -e "$RED Invalid input. Please try again. $NORMAL"
                ;;
            esac
            ;;
        1)
            case "$answer" in
            [1-$propositionsLength])
                break
                ;;
            *)
                clear
                echo -e "$RED Invalid input. Please try again. $NORMAL"
                ;;
            esac
            ;;
        *)
            echo "$RED Wrong value for parameter 'quit'. $NORMAL"
        esac
    done
    if [[ "$index" -eq 0 ]]; then
        eval "$varRef=${answer}"
    else 
        eval "$varRef=${propositions[${answer}-1]}"
    fi
}
