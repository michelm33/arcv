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
# Release file path: arcv__options.sh
# Release file date: 2026-07-23 13:39
# App version: 1.0.0
# App source revision: 187
# App source signature: 9587ec243d426d1f1f5fa7cc56c40357fe0bc6534e238c84dfcee4dfd8b54a87
# Source file last modification: 2026-07-23 11:49:27.627677388 +0200
#
# This header was generated. Do not modify.
#
# ------------------------------------------------------------------------------
#
# This file contains the definition of all options supported by arcv.
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

# Keys are option alternatives separated by |
declare -A ARCV__OPTION_LIST_SDESC # Option short description 
declare -A ARCV__OPTION_LIST_DESC # Option description
declare -A ARCV__OPTION_LIST_ARGS # Tells whether arg expected or none
declare -A ARCV__OPTION_LIST_ARGS_TYPE # Give the type of the argument(s)
declare -A ARCV__OPTION_LIST_VALS # Executed code when processing an expected arg
declare -A ARCV__OPTION_LIST_ACTI # Executed code when option is detected
declare -A ARCV__OPTION_LIST_INTERN # Tells whether the option is not intended for end-users or only for advanced ones

# arg 1: 1=no value expected, 0 value expected

ARCV__OPTION_LIST_SDESC["diff"]="Make a diff with the specified revision using system diff tool"
ARCV__OPTION_LIST_DESC["diff"]="
Makes a diff with the specified revision using the system diff tool.
When no revision number is supplied, the head revision is considered by default.
Returns 0 when no difference is detected, 1 otherwise.
"
ARCV__OPTION_LIST_ARGS["diff"]="2"
ARCV__OPTION_LIST_ACTI["diff"]='
ARCV__VARS["checkin"]=false
ARCV__VARS["diff"]=true
ARCV__VARS["diff_rev"]="head" 
'
ARCV__OPTION_LIST_ARGS_TYPE["diff"]="(REVISION | head | current)[vs(REVISION | RELEASE TAG)]"
ARCV__OPTION_LIST_VALS["diff"]='

ARCV__VARS["checkin"]=false
Arcv__parseDiffArgValue "${__myarg}"
'           # Action to be executed when option accepts a value



ARCV__OPTION_LIST_SDESC["meld"]="Make a diff with the specified revision using meld tool"
ARCV__OPTION_LIST_DESC["meld"]="
Makes a diff with the specified revision using meld tool. 
When no revision number is supplied, the head revision is considered by default.
"
ARCV__OPTION_LIST_ARGS["meld"]="2"
ARCV__OPTION_LIST_ACTI["meld"]='
ARCV__VARS["checkin"]=false
ARCV__VARS["meld"]=true
# By default, perform a diff between current and head
ARCV__VARS["diff_rev"]="head" 
'
ARCV__OPTION_LIST_ARGS_TYPE["meld"]="(REVISION | head | current)[vs(REVISION | RELEASE TAG)]"
ARCV__OPTION_LIST_VALS["meld"]='

ARCV__VARS["checkin"]=false
Arcv__parseDiffArgValue "${__myarg}"
'           # Action to be executed when option accepts a value



ARCV__OPTION_LIST_SDESC["git"]="Make a diff with the specified revision using git"
ARCV__OPTION_LIST_DESC["git"]="
Makes a diff with the specified revision using git. 
When no revision number is supplied, the head revision is considered by default.
"
ARCV__OPTION_LIST_ARGS["git"]="2"
ARCV__OPTION_LIST_ACTI["git"]='
ARCV__VARS["checkin"]=false
ARCV__VARS["git"]=true
# By default, perform a diff between current and head
ARCV__VARS["diff_rev"]="head" 
'
ARCV__OPTION_LIST_ARGS_TYPE["git"]="(REVISION | head | current)[vs(REVISION | RELEASE TAG)]"
ARCV__OPTION_LIST_VALS["git"]='

ARCV__VARS["checkin"]=false
Arcv__parseDiffArgValue "${__myarg}"
'           # Action to be executed when option accepts a value



ARCV__OPTION_LIST_SDESC["rev"]="Display the head revision number"
ARCV__OPTION_LIST_DESC["rev"]="
Displays the head revision number
"
ARCV__OPTION_LIST_ARGS["rev"]="1"
ARCV__OPTION_LIST_ACTI["rev"]='
ARCV__VARS["checkin"]=false
ARCV__VARS["rev"]=true
'


ARCV__OPTION_LIST_SDESC["list"]="List the existing source folders stored in the repository"
ARCV__OPTION_LIST_DESC["list"]="
Lists the existing source folders stored in the repository
"
ARCV__OPTION_LIST_ARGS["list"]="1"
ARCV__OPTION_LIST_ACTI["list"]='
ARCV__VARS["checkin"]=false
ARCV__VARS["list"]=true
'


ARCV__OPTION_LIST_SDESC["hash"]="Display the hash signature for the head revision or the specified folder"
ARCV__OPTION_LIST_DESC["hash"]="
Displays the hash signature of the head revision when no argument is supplied.
Otherwise, computes the hash signature for the passed directory path
"
ARCV__OPTION_LIST_ARGS["hash"]="2"
ARCV__OPTION_LIST_ACTI["hash"]='
ARCV__VARS["checkin"]=false
ARCV__VARS["hash"]=true
'
ARCV__OPTION_LIST_ARGS_TYPE["hash"]="DIRECTORY"
ARCV__OPTION_LIST_VALS["hash"]='
ARCV__VARS["hash_folder"]="${__myarg}"
'           # Action to be executed when option accepts a value



ARCV__OPTION_LIST_SDESC["check"]="Tell whether there are uncommitted modifications"
ARCV__OPTION_LIST_DESC["check"]="
Tells whether there are uncommitted modifications. Return 0 when so, 1 otherwise.
"
ARCV__OPTION_LIST_ARGS["check"]="1"
ARCV__OPTION_LIST_ACTI["check"]='
ARCV__VARS["checkin"]=false
ARCV__VARS["checkformodif"]=true
ARCV__VARS["diff_rev"]=""  # use last version
'


# Note -v is reserved for displaying version
ARCV__OPTION_LIST_SDESC["--verbose"]="Verbose mode"
ARCV__OPTION_LIST_DESC["--verbose"]="
Verbose mode
"
ARCV__OPTION_LIST_ARGS["--verbose"]="1"
ARCV__OPTION_LIST_ACTI["--verbose"]='ARCV__VARS["verbose"]=true'



ARCV__OPTION_LIST_SDESC["co"]="Either update current source folder with head revision (no arguments) or checkout resp. the revision, release tag, file from head revision to the specified output folder"
ARCV__OPTION_LIST_DESC["co"]="

When used without argument, checks out all files of the head revision. Any file of the current source may get overwritten or removed.
Otherwise, checks out the specified revision, release tag or file from head revision to the specified output folder.
"   
ARCV__OPTION_LIST_ARGS_TYPE["co"]="REVISION | RELEASE TAG | FILENAME[:REVISION]"
ARCV__OPTION_LIST_ARGS["co"]="2"      # 0:mandatory value, 1:no value, 2:optional value
ARCV__OPTION_LIST_ACTI["co"]='
    ARCV__VARS["diff_rev"]="head"
    ARCV__VARS["checkout"]="head"
    ARCV__VARS["checkin"]=false    
'           # Action to be executed when option is read 
ARCV__OPTION_LIST_VALS["co"]='

# in Arcv__checkout:
#  a) ARCV__VARS["checkout"] is checked 1st as a valid release testing symlink with that name
#  b) it is tested whether a file named ARCV__VARS["checkout"] exists in head, but
#     only when no output folder was specified OR if ARCV__VARS["file_rev"] not empty
#     meaning a specific file rev is being checked out
#  c) by default, ARCV__VARS["diff_rev"] is used for rev checkout, ARCV__VARS["checkout"] is ignored

if Int__isInt "$__myarg"  ; then
    # CHECKOUT SOURCE FOLDER OF A GIVEN REVISION 
    # diff_rev and checkout are set to the rev number
    ARCV__VARS["diff_rev"]="${__myarg}"
    ARCV__VARS["checkout"]="$__myarg"
else
    local filename=""
    local revision=""
    Str__split "$__myarg" filename ":" revision 1
    if [ ! -z "$filename" ] &&  [ ! -z "$revision" ] ; then
        if Int__isInt "$revision"  ; then
            ARCV__VARS["checkout"]="$filename"
            ARCV__VARS["diff_rev"]="${revision}"            
            ARCV__VARS["file_rev"]="${revision}" # Indicates there is an explicit file revision checkout (not head) 
        else
            _susage "Invalid argument '${__myarg}'. '$revision' must be an integer"
        fi
    else
        # CHECKOUT SOURCE FOLDER FROM RELEASE TAG
        # OR FILE FROM HEAD
        # ARCV__VARS["diff_rev"] is not set and unchanged
        ARCV__VARS["checkout"]="$__myarg"
    fi
fi

ARCV__VARS["checkin"]=false
'           # Action to be executed when option accepts a value


ARCV__OPTION_LIST_SDESC["branch"]="Branch off a revision"
ARCV__OPTION_LIST_DESC["branch"]="
Branch off a revision.
"   
ARCV__OPTION_LIST_ARGS_TYPE["branch"]="BRANCH_FOLDER[:REVISION | RELEASE TAG]"
ARCV__OPTION_LIST_ARGS["branch"]="0"      # 0:mandatory value, 1:no value, 2:optional value
ARCV__OPTION_LIST_ACTI["branch"]=""           # Action to be executed when option is read
ARCV__OPTION_LIST_VALS["branch"]='
# Branch arg of type [<revision|release tag>:]branchname
local rev1=""
local rev2=""
Str__split "$__myarg" rev1 ":" rev2 1
if [ ! -z "$rev1" ] &&  [ ! -z "$rev2" ] ; then
    # It makes not sense to branch from current, all files must have been checked it first
    if Int__isInt "$rev2" || [ "$rev2" = "head" ] ; then
        ARCV__VARS["diff_rev"]="$rev2"
    else
        ARCV__VARS["diff_rev"]=""
        ARCV__VARS["2nd_diff_rev"]="$rev2"
    fi

    ARCV__VARS["branch"]="$rev1"
else
    ARCV__VARS["diff_rev"]="head"
    ARCV__VARS["branch"]="$rev1"
fi

ARCV__VARS["checkin"]=false
ARCV__VARS["checkout_folder"]=".."
'           # Action to be executed when option accepts a value



ARCV__OPTION_LIST_INTERN["--branch-root"]=0

ARCV__OPTION_LIST_SDESC["--branch-root"]="The source project from which the current source folder being committed has been branched off."
ARCV__OPTION_LIST_DESC["--branch-root"]="
The source project from which the current source folder being committed has been branched off
Only for internal usage
"   
ARCV__OPTION_LIST_ARGS_TYPE["--branch-root"]="DIRECTORY"
ARCV__OPTION_LIST_ARGS["--branch-root"]="0"      # 0:mandatory value, 1:no value, 2:optional value
ARCV__OPTION_LIST_ACTI["--branch-root"]=""           # Action to be executed when option is read
ARCV__OPTION_LIST_VALS["--branch-root"]='
    ARCV__VARS["branch-root"]="$__myarg"
'           # Action to be executed when option accepts a value


ARCV__OPTION_LIST_INTERN["--branch-root-rev"]=0

ARCV__OPTION_LIST_SDESC["--branch-root-rev"]="The revision of the source project from which the current source folder being committed has been branched off."
ARCV__OPTION_LIST_DESC["--branch-root-rev"]="
The revision of the source project from which the current source folder being committed has been branched off
Only for internal usage
"   
ARCV__OPTION_LIST_ARGS_TYPE["--branch-root-rev"]="DIRECTORY"
ARCV__OPTION_LIST_ARGS["--branch-root-rev"]="0"      # 0:mandatory value, 1:no value, 2:optional value
ARCV__OPTION_LIST_ACTI["--branch-root-rev"]=""           # Action to be executed when option is read
ARCV__OPTION_LIST_VALS["--branch-root-rev"]='
    ARCV__VARS["branch-root-rev"]="$__myarg"
'           # Action to be executed when option accepts a value






ARCV__OPTION_LIST_SDESC["pub"]="Creates a new release by tagging the head revision with the content of the VERSION.txt file."
ARCV__OPTION_LIST_DESC["pub"]="
Creates a new release by tagging the head revision with the content of the VERSION.txt file. 
Then it prompts the user for the next version and updates VERSION.txt accordingly.
"   
ARCV__OPTION_LIST_ARGS["pub"]="1"      # 0:mandatory value, 1:no value, 2:optional value
ARCV__OPTION_LIST_ACTI["pub"]='
ARCV__VARS["checkin"]=false
ARCV__VARS["publish"]=true
ARCV__VARS["diff_rev"]=""  # use last version
'          # Action to be executed when option is read



ARCV__OPTION_LIST_SDESC["tarball"]="Create a tarball for the current source folder or the specified revision"
ARCV__OPTION_LIST_DESC["tarball"]="
Creates a tarball for the current source folder or the specified revision. 
When used without argument, creates a tarball for the current source folder, i.e. the current working directory.
When a revision number is supplied as argument, creates a tarball for the specified revision. 
In both cases, the current working directory must be the root of the versioned folder.
"
ARCV__OPTION_LIST_ARGS["tarball"]="2"
ARCV__OPTION_LIST_ACTI["tarball"]='
ARCV__VARS["checkin"]=false
ARCV__VARS["tarball"]=true
ARCV__VARS["diff_rev"]="current" 
'
ARCV__OPTION_LIST_ARGS_TYPE["tarball"]="REVISION | head"
ARCV__OPTION_LIST_VALS["tarball"]='
ARCV__VARS["checkin"]=false
__revision="${__myarg}"
Str__toLower __revision
#if [ "$__revision" != "head" ] ; then
#    _exit -1 "Invalid revision <$__revision> specified. At the moment, only <current> (default, no arg) and <head> are supported."
#fi
ARCV__VARS["diff_rev"]="${__revision}"
'



ARCV__OPTION_LIST_SDESC["export"]="Export to a remote Git repo"
ARCV__OPTION_LIST_DESC["export"]="
When used without argument, exports the head revision to the remote Git repo. 
When the path to a folder is supplied as argument, exports the content of that folder to the remote Git repo.
This latter usage is suitable e.g. to export the clean release version of the source file tree, built at another location.
The URL of the remote Git repo shall be given in GITHUB.txt
"   
ARCV__OPTION_LIST_ARGS["export"]="2"      # 0:mandatory value, 1:no value, 2:optional value
ARCV__OPTION_LIST_ARGS_TYPE["export"]="DIRECTORY"
ARCV__OPTION_LIST_ACTI["export"]=' # Action to be executed when option is read
ARCV__VARS["checkin"]=false
ARCV__VARS["export"]=true
' 
ARCV__OPTION_LIST_VALS["export"]=' # Action to be executed when an option value is passed
    ARCV__VARS["checkin"]=false
    ARCV__VARS["export"]=true
    ARCV__VARS["exp_folder"]="${__myarg}"
    #ARCV__VARS["export_rev"]="$__myarg" # OLD
'  


ARCV__OPTION_LIST_SDESC["-y"]="Assume 'Yes' when prompted for confirmation"
ARCV__OPTION_LIST_DESC["-y"]="
Assume 'Yes' answer for any confirmation request
"
ARCV__OPTION_LIST_ARGS["-y"]="1"
ARCV__OPTION_LIST_ACTI["-y"]='
if Input__testYesForcedInput ; then
    # If option is specified twice, then enforce default value entry or selection
    ARCV__VARS["force-default-entry"]=true
else
    Input__pushForcedInput "y"
fi
'


ARCV__OPTION_LIST_SDESC["-n"]="Assume 'No' when prompted for confirmation"
ARCV__OPTION_LIST_DESC["-n"]="
Assume 'No' answer for any confirmation request
"
ARCV__OPTION_LIST_ARGS["-n"]="1"
ARCV__OPTION_LIST_ACTI["-n"]='Input__pushForcedInput "n"'


ARCV__OPTION_LIST_INTERN["--subproc"]=0
ARCV__OPTION_LIST_SDESC["--subproc"]="Indicate the app is called by another instance of it"
ARCV__OPTION_LIST_DESC["--subproc"]="
Indicates the app is called by another instance of it
"
ARCV__OPTION_LIST_ARGS["--subproc"]="1"
ARCV__OPTION_LIST_ACTI["--subproc"]='ARCV__VARS["subproc"]=true'


ARCV__OPTION_LIST_SDESC["log"]="Show the revision log messages from most recent to the oldest, for the whole source or only the specified file."
ARCV__OPTION_LIST_DESC["log"]="
Without argument, shows the global commit history of the source folder.
Otherwise, shows the commit history for the specified file. 
The global history is always shown from most recent to the oldest in batches of 5.
The file-specific history is shown from most recent to the oldest as a terminal menu, from which the changes can be checked against head revision
"   
ARCV__OPTION_LIST_ARGS["log"]="2"      # 0:mandatory value, 1:no value, 2:optional value
ARCV__OPTION_LIST_ARGS_TYPE["log"]="FILENAME"
ARCV__OPTION_LIST_ACTI["log"]='
ARCV__VARS["checkin"]=false
ARCV__VARS["revisionlog"]=true
'          # Action to be executed when option is read

ARCV__OPTION_LIST_VALS["log"]='
ARCV__VARS["revisionlog_file"]="${__myarg}"
'

ARCV__OPTION_LIST_SDESC["-f"]='Configure the arcv operational config filename (permament)'

ARCV__OPTION_LIST_DESC["-f"]='
Arcv operational configuration filename, if different of the default one coming along with the app, modified or not.
'
ARCV__OPTION_LIST_ARGS["-f"]="0" 
ARCV__OPTION_LIST_ARGS_TYPE["-f"]="FILENAME"
ARCV__OPTION_LIST_ACTI["-f"]=""
ARCV__OPTION_LIST_VALS["-f"]='

local value="$(realpath --relative-to "$HOME" "${__myarg}")"

if [ ! -f "${__myarg}" ] ; then
    _exit -1 "Arcv operational configuration file ${__myarg} does not exist or invalid file. Aborted."    
fi

_appendConfig "arcv config" "$value"
if [ $? -ne 0 ] ; then
    local cfgFile
    _getConfigFilePath cfgFile
    _exit -1 "Failed to update '$' with the path of the new Arcv configuration file $value. Aborted."    
fi

ARCV__VARS["ARCV_CONFIG"]="${value}"
_quit "Successfully change operation config file to ${value}"

'

ARCV__OPTION_LIST_SDESC["-o|--output"]='Output folder for checkouts or tarball exports'

ARCV__OPTION_LIST_DESC["-o|--output"]='
Output folder for checkouts or tarball exports
'
ARCV__OPTION_LIST_ARGS["-o|--output"]="0" 
ARCV__OPTION_LIST_ARGS_TYPE["-o|--output"]="DIRECTORY"
ARCV__OPTION_LIST_ACTI["-o|--output"]=""
ARCV__OPTION_LIST_VALS["-o|--output"]='

local value="$(realpath "${__myarg}")"

if [ ! -d "${__myarg}" ] ; then
    _exit -1 "Output folder ${__myarg} does not exist or invalid folder. Aborted."    
fi
ARCV__VARS["checkout_folder"]="$value"
'


ARCV__OPTION_LIST_SDESC["--debug"]="Activate debug logs"
ARCV__OPTION_LIST_DESC["--debug"]='
Activate debug logs
'
ARCV__OPTION_LIST_ARGS["--debug"]="1"
ARCV__OPTION_LIST_ACTI["--debug"]='__LOG_DEBUG__=0'



ARCV__OPTION_LIST_SDESC["-m|--message"]='Commit log message'

ARCV__OPTION_LIST_DESC["-m|--message"]='
Log message
'
ARCV__OPTION_LIST_ARGS["-m|--message"]="0" 
ARCV__OPTION_LIST_ARGS_TYPE["-m|--message"]="STRING"
ARCV__OPTION_LIST_ACTI["-m|--message"]=""
ARCV__OPTION_LIST_VALS["-m|--message"]='
ARCV__VARS["log_message"]="${__myarg}"
'


ARCV__OPTION_LIST_SDESC["--silent"]="Silent mode"
ARCV__OPTION_LIST_DESC["--silent"]="
Silent mode. Hides messages which are usually displayed even when verbose mode is not active.
"
ARCV__OPTION_LIST_ARGS["--silent"]="1"
ARCV__OPTION_LIST_ACTI["--silent"]='ARCV__VARS["silent"]=true'



ARCV__OPTION_LIST_SDESC["--source"]='Source directory to checkout from the repository'

ARCV__OPTION_LIST_DESC["--source"]='
Source directory to checkout from the repository. The source folder to checkout can be specified with this option instead of resolving the source folder from the current working directory.
'
ARCV__OPTION_LIST_ARGS["--source"]="0" 
ARCV__OPTION_LIST_ARGS_TYPE["--source"]="DIRECTORY"
ARCV__OPTION_LIST_ACTI["--source"]=""
ARCV__OPTION_LIST_VALS["--source"]='
ARCV__VARS["explicit_backupsrc"]="${__myarg}"
'




ARCV__OPTION_LIST_SDESC["-X|--exclude"]='Prevent certain file patterns to be checked in'

ARCV__OPTION_LIST_DESC["-X|--exclude"]='
Prevent certain file patterns to be checked in. 
The file patterns must be supplied as a coma-separated list of file patterns
'
ARCV__OPTION_LIST_ARGS["-X|--exclude"]="0" 
ARCV__OPTION_LIST_ARGS_TYPE["-X|--exclude"]="FILE PATTERNS"
ARCV__OPTION_LIST_ACTI["-X|--exclude"]=""
ARCV__OPTION_LIST_VALS["-X|--exclude"]='
ARCV__VARS["excluded_file_patterns"]="${__myarg}"
'



# implement that later
# if absolute the host and nfs params may have to be hidden
:<<'EOF'
ARCV__OPTION_LIST_SDESC["--repo"]='Changes the repository to use to archive revisions, persistently'

ARCV__OPTION_LIST_DESC["--repo"]='
Specifies the repository to use to archive revisions. This will actually update
the 'storage' parameter of the main configuration file
'
ARCV__OPTION_LIST_ARGS["--repo"]="0" 
ARCV__OPTION_LIST_ARGS_TYPE["--repo"]="DIRECTORY"
ARCV__OPTION_LIST_ACTI["--repo"]=""
ARCV__OPTION_LIST_VALS["--repo"]='

local value="$(realpath --relative-to "$HOME" "${__myarg}")"

if [ ! -d "${__myarg}" ] ; then
    _exit -1 "Repository folder ${__myarg} does not exist or invalid folder. Aborted."    
fi
echo "OPERATIONAL CONFIG : ${ARCV__VARS["ARCV_CONFIG"]}"
exit 0
'
EOF
