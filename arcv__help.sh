#!/bin/bash
###############################################################################
# Arcv revision control tool
# 
# Copyright (c) 2024-2026 Michel Mehl.
# All rights reserved. 
# Tous droits réservés (France).
# 
# License terms written down in file LICENSE.txt
# Les termes de la licence sont détaillés dans le fichier LICENSE.txt
# 
# Release file path: arcv__help.sh
# Release file date: 2026-07-23 13:39
# App version: 1.0.0
# App source revision: 187
# App source signature: 9587ec243d426d1f1f5fa7cc56c40357fe0bc6534e238c84dfcee4dfd8b54a87
# Source file last modification: 2026-07-15 17:21:51.851329003 +0200
#
# This header was generated. Do not modify.
#
# ------------------------------------------------------------------------------
#
# This file contains the code related the usage and help documentation.
#
# ------------------------------------------------------------------------------
# 
# Report bugs and suggestions: 
#     assistance@slashetc.fr
# 
# Specific or corporate requirements or extensions: 
#     info@slashetc.fr
# 
# The author is overall not required to provide maintenance or support 
# outside specific commercial terms agreed.
# 
###############################################################################

:<<'EOF'
Version and copyright display callback (-h)
EOF

Arcv__version() {
  local verfile="${ARCV__VARS["MY_DIR"]}/VERSION.txt"
  local revfile="${ARCV__VARS["MY_DIR"]}/REVISION.txt"
  local copyright="${ARCV__VARS["MY_DIR"]}/COPYRIGHT.txt"

  # Version info
  echo -n "${__SHELL_CURRENT_APPNAME__} "
  if [ -f "${verfile}" ] ;  then
    cat "${verfile}"
  else
    echo "?.?.?"
  fi
  
  # Revision info if any
  if [ -f "${revfile}" ] ;  then
    echo -n "Revision "
    local line
    local cnt=0
    while IFS=''  read -r line
    do
      if [ $cnt -eq 0 ] ; then
        echo -n "$line"
      elif [ $cnt -eq 1 ] ; then
        echo -n " signed $line"
      fi
      cnt=$(($cnt + 1))
    done < <(cat "${revfile}")

    if [ $cnt -eq 1 ] ; then
          echo -n " (unsigned)"
    fi    
    echo
  fi

  # Copyright
  if [ -f "${copyright}" ] ;  then
    echo
    local content="$(cat "${copyright}")"
    echo "${content}"|tail -n+3
  fi

  # Author
  local fnUser=""
  User__getFullUserName fnUser
cat<<EOF

Written by ${fnUser}

EOF
}

Arcv__revision() {
  local revfile="${ARCV__VARS["MY_DIR"]}/REVISION.txt"

  # Revision info if any
  if [ -f "${revfile}" ] ;  then
    local line
    local __lcnt=0
    local revisionnum=""
    while IFS=''  read -r line
    do
      if [ ${__lcnt} -eq 0 ] ; then
        revisionnum="$line"
        break
      fi
      __lcnt=$((${__lcnt} + 1))
    done < <(cat "${revfile}")

    if [ -z "$revisionnum" ] ; then
      echo "?"
    else
      echo "$revisionnum"
    fi
  else
    echo "?"
  fi
}

Arcv__hash() {
  local revfile="${ARCV__VARS["MY_DIR"]}/REVISION.txt"

  # Revision info if any
  if [ -f "${revfile}" ] ;  then
    local line
    local __lcnt=0
    local hashcode=""
    while IFS=''  read -r line
    do
      if [ ${__lcnt} -eq 1 ] ; then
        hashcode="$line"
        break
      fi
      __lcnt=$((${__lcnt} + 1))
    done < <(cat "${revfile}")

    if [ -z "$hashcode" ] ; then
      echo "?"
    else
      echo "$hashcode"
    fi
  else
    echo "?"
  fi
}


Arcv__versionnum() {
  local vfile="${ARCV__VARS["MY_DIR"]}/VERSION.txt"
  if [ -f "$vfile" ] ; then
cat << EOF
$(cat "$vfile")
EOF
  else
    echo "?"
  fi
}


:<<'EOF'
Help display callback (-h) for usage
EOF

Arcv__help() {
  echo
  Arcv__susage
}

:<<'EOF'
Manual display callback (-h)
EOF

#$(basename ${__SHELL_SRC_NAME__}) - A central mount and unmount control tool for heterogeneous data sources and simple disk files creation.

:<<'EOF'
Take care, 2 consecutive spaces inside a paragraph have a meaning for helpman, it starts on a new line!
EOF
Arcv__man() {
local rawMan="$(cat << EOF
*SYNOPSIS*

$(Arcv__susage man)

*DESCRIPTION*

arcv is a lightweight, easy-to-use revision control system which keeps untouched the user's original source files and folders.

Unless some traditional well-known revision control systems, 'arcv' fully respects the user's source folder integrity and does not 'pollute' it with any additional files to achieve revision control. The revision control data are centralized in a dedicated folder, the repository, which can be either a local directory or a mountpoint to a directory located on an external system.

'arcv' only relies on standard system tools and there's no additional command set overlay needed to learn and use, e.g., for adding or removing files. For instance, to exclude and remove a file from the revision control, it is enough to remove the file from the system and commit the new revision. To add a new file, this file just needs to be present before commit.

The architecture of 'arcv' is readable and open, which enables users to keep full control of the revisions and easily apply common corrective actions without pain. E.g. if the user only recognizes somewhen afterwards that a log message was incomplete or incorrect, it can simply modify the CHANGE_LOG file containing the message, without needing to execute multiple operations and the tooling skills coming along.

Overall, the above few mentioned features enable 'arcv' to be of an extreme simplicity of use at the reach of anybody, even non-developers. It enables an instant step-in and a drastic reduction of the learning curve and daily time overhead generally required to manage revision control. 

AUDIENCE

  arcv can be used by developers for the following purposes:

  - Individual developers or single person-lead projects

  - Early development stages of projects, prototyping

  - Individual, well-targeted, independent development lines or branches, which can be easily integrated into the main branch or another revision control system without polluting or unnecessarily complexifying his historical record.

 It can also be used as general-purpose incremental backup tool.

PLATFORMS

  Arcv is a bash script primarly developed and tested under Ubuntu. 
  Because it features only minimalistic dependencies, it is deemed to run on most Linux systems and Cygwin-enhanced Windows systems. 

DOCUMENTATION

  Please refer to the online page https://slashetc.fr/en/developertoolsforlinux/arcv/arcv__documentation.html to access the full documentation:

  - Command usage with full examples

  - Architecture insight

  - Other pratical information

SYSTEM DEPENDENCIES

  Arcv automatically handles dependencies toward external system packages, i.e. it attempts to install all required system packages, e.g. meld or tar, when necessary.

$(_optionsN ARCV__OPTION_LIST_DESC ARCV__OPTION_LIST_ARGS ARCV__OPTION_LIST_ARGS_TYPE ARCV__OPTION_LIST_INTERN 0)
$(_optionsN ARCV__OPTION_LIST_DESC ARCV__OPTION_LIST_ARGS ARCV__OPTION_LIST_ARGS_TYPE ARCV__OPTION_LIST_INTERN 1)

*EXAMPLES*

  Please check the online cheatsheet https://slashetc.fr/en/developertoolsforlinux/arcv/arcv__cheatsheet.html

Report bugs to <michel.mehl@slashetc.fr>

EOF
)"
  # This is useless, because man performs automatically the paging
  # it may only be useful when calling arcv --man, but its output is only 
  # used to generate manpage and not the web version of the man page either
  #Str__fitToLineWidth rawMan 90
  printf "%s" "$rawMan"
}

:<<'EOF'
Short usage display callback 
EOF

Arcv__examples() {
        cat << EOF        
Examples:


EOF
}

:<<'EOF'
Short usage display callback 
EOF

Arcv__susage() {
  local ctrlFlag=""
  if [ $# -gt 0 ] ; then
    ctrlFlag="$1"
  fi
cat << EOF

Usage: $(basename $0) [OPTIONS] [COMMAND]

COMMAND:

$(_soptions ARCV__OPTION_LIST_DESC ARCV__OPTION_LIST_SDESC ARCV__OPTION_LIST_ARGS ARCV__OPTION_LIST_ARGS_TYPE ARCV__OPTION_LIST_INTERN 0 $ctrlFlag)

OPTIONS:

$(_soptions ARCV__OPTION_LIST_DESC ARCV__OPTION_LIST_SDESC ARCV__OPTION_LIST_ARGS ARCV__OPTION_LIST_ARGS_TYPE ARCV__OPTION_LIST_INTERN 1 $ctrlFlag)
EOF
}

:<<'EOF'
Usage display callback 
EOF

Arcv__usage() {
        local susage_txt="$(Arcv__susage|grep -v -E ^Basic options\:|grep -v -E ^[[:blank:]]*-o|grep -v -E ^[[:blank:]]*-h)"  #|grep -v -E ^Options\:|grep -- -v -E ^\ -f|grep -- -v -E ^\ -h)"
cat << EOF
${susage_txt}

<command>
        command: co,check,rev,diff,meld,log,pub,tarball,export. None=commit changes or create new repo if no archive exists yet.
 
EOF
}

