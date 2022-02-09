#!/bin/bash

# @description Run an asynchron call of a function.
#
# @example
#   foo()  { zip foo.zip *; }
#   bar()  { echo "done!";  }
#   async::run foo bar
#
# @arg $1 function The function to run in background.
# @arg $2 function The callback function.
# @arg $3 int Flag to activate the loading during the processing of the main
# function.
#
# @exitcode 0 Success.
# @exitcode 2 Function missing arguments.
function async::run()
{
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2
    {
        $1 &>/dev/null
        $2
    }&
    if [[ "$3" == 1 ]] ; then
        async::loading
    fi
}

# @description Display a loading animation during the process
# of the main function.
#
# @example
#   async::loading
#
# @exitcode 0 Success.
function async::loading()
{
    spin='-\|/'
    i=0
    while [[ -n $(jobs -r) ]]
    do
        i=$(( (i+1) %4 ))
        printf "\rLoading %s" ${spin:$i:1}
        sleep .1
    done
}

# @description Placeholder for the callback function.
#
# @example
#   async::noCallback
#
# @exitcode 0 Success.
function async::noCallback()
{
  return 0
}

# @description Callback function to display a message.
#
# @example
#   async::msgCallback "Message"
#
# @arg $1 string The message to display.
#
# @exitcode 0 Success.
function async::msgCallback()
{
  echo -e "\r$*"
  echo ""
}
