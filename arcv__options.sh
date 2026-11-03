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
# Release file date: 2026-10-25 20:11
# App version: 2.0.0
# App source revision: 397
# App source signature: c2611dc49f82084f15e5e4ce636132e150e50807672d858fde255dd1be30c96a
# Source file last modification: 2026-10-24 17:19:36.942516452 +0200
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
declare -A ARCV__OPTION_LIST_ENUM # If the argument is an enum value, this gives all allowed values 

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
ARCV__OPTION_LIST_SDESC["--verbose|-V"]="Verbose mode"
ARCV__OPTION_LIST_DESC["--verbose|-V"]="
Verbose mode
"
ARCV__OPTION_LIST_ARGS["--verbose|-V"]="1"
ARCV__OPTION_LIST_ACTI["--verbose|-V"]='ARCV__VARS["verbose"]=true'


ARCV__OPTION_LIST_SDESC["--no-cache|-U"]="Force updating computed data instead of using cached one"
ARCV__OPTION_LIST_DESC["--no-cache|-U"]="
Force updating computed data instead of using cached one
"
ARCV__OPTION_LIST_ARGS["--no-cache|-U"]="1"
ARCV__OPTION_LIST_ACTI["--no-cache|-U"]='ARCV__VARS["force-refresh"]=true'



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



ARCV__OPTION_LIST_SDESC["pub"]="Create a new release tag"
ARCV__OPTION_LIST_DESC["pub"]="
When no argument is supplied, creates a new release by tagging the head revision with the content of the VERSION.txt file. 
Then it prompts the user for the next version and updates VERSION.txt accordingly.
"
ARCV__OPTION_LIST_ARGS_TYPE["pub"]="RELEASE TAG:REVISION"
ARCV__OPTION_LIST_ARGS["pub"]="2"      # 0:mandatory value, 1:no value, 2:optional value
ARCV__OPTION_LIST_ACTI["pub"]='
    ARCV__VARS["checkin"]=false
    ARCV__VARS["publish"]=true
    ARCV__VARS["diff_rev"]=""  # use last version
'          # Action to be executed when option is read
ARCV__OPTION_LIST_VALS["pub"]='
    local tagname=""
    local revision=""
    Str__split "$__myarg" tagname ":" revision 1
    if [ -z "$tagname" ] ||  [ -z "$revision" ] ; then
        _exit -1 "Invalid <tag:rev> argument ${__myarg}."
    fi
    ARCV__VARS["publish-tag"]="$tagname"
    ARCV__VARS["diff_rev"]="$revision"
'




ARCV__OPTION_LIST_SDESC["hook"]="Create a release hook and lists the hook(s)"
ARCV__OPTION_LIST_DESC["hook"]="
Without arguments, lists the defined hook(s).
Otherwise, creates a release hook with the passed executable that will be run whenever a release tag is created. It will ensure that hook as the execution rights
"
ARCV__OPTION_LIST_ARGS_TYPE["hook"]="FILE"
ARCV__OPTION_LIST_ARGS["hook"]="2"      # 0:mandatory value, 1:no value, 2:optional value
ARCV__OPTION_LIST_ACTI["hook"]='
    ARCV__VARS["checkin"]=false
    ARCV__VARS["releaselog"]=true      
    ARCV__VARS["releasehooks"]=true
'         
ARCV__OPTION_LIST_VALS["hook"]='
    ARCV__VARS["releaselog"]=false      
    ARCV__VARS["releasehooks"]=false
    ARCV__VARS["silent"]=true
    ARCV__VARS["publish"]=true
    ARCV__VARS["diff_rev"]=""  # use last version
    ARCV__VARS["hook"]="${__myarg}"
'


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


ARCV__OPTION_LIST_SDESC["-l"]="Dry check-in, listing only new/deleted/changed files"
ARCV__OPTION_LIST_DESC["-l"]="
Dry check-in, listing only new/deleted/changed files
"
ARCV__OPTION_LIST_ARGS["-l"]="1"
ARCV__OPTION_LIST_ACTI["-l"]='
ARCV__VARS["check-in-list-only"]=true
'



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


ARCV__OPTION_LIST_SDESC["rel"]="Show the release log messages from most recent to the oldest"
ARCV__OPTION_LIST_DESC["rel"]="
Shows the release log messages from most recent to the oldest
"   
ARCV__OPTION_LIST_ARGS["rel"]="1"      # 0:mandatory value, 1:no value, 2:optional value
ARCV__OPTION_LIST_ACTI["rel"]='
ARCV__VARS["checkin"]=false
ARCV__VARS["releaselog"]=true
'          # Action to be executed when option is read


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



ARCV__OPTION_LIST_SDESC["destroy"]="Put folder out of revision control and delete all related file from repositiory"
ARCV__OPTION_LIST_DESC["destroy"]="
Put folder out of revision control and delete all related file from repositiory
"
ARCV__OPTION_LIST_ARGS["destroy"]="1"
ARCV__OPTION_LIST_ACTI["destroy"]='
ARCV__VARS["destroy-repo"]=true
ARCV__VARS["checkin"]=false
'


ARCV__OPTION_LIST_SDESC["--source"]='Source directory to checkout from the repository'

ARCV__OPTION_LIST_DESC["--source"]='
Either a source directory to checkout from the repository or an URI from which to fetch the data from. Currently, only MongoDB URI are supported. 

The source folder to checkout can be specified with this option instead of resolving the source folder from the current working directory.

When the value is an URI, it can also be used for the sake of putting under revision control the data fetched from the URI or create a new revision directly from the URI without requiring an existing source folder. 

A Mongo database content is fetched below the current workding directory, inside a source folder of the form "mongodb-<database name>@<database host>-<database port>". The database content is written into a Gzipped archive file is created of the form "mongo-db-<database name>.gz".

Afterwards, an existing source folder can be used to create new revisions from the database simply by passing --fetch to the regular arcv commit command (arcv without argument), because the repository records the original fetch URI.
'
ARCV__OPTION_LIST_ARGS["--source"]="0" 
ARCV__OPTION_LIST_ARGS_TYPE["--source"]="DIRECTORY | <URI>"
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


ARCV__OPTION_LIST_SDESC["repo"]='Display the specified information of the repository or all when none specified'

ARCV__OPTION_LIST_DESC["repo"]='
Displays the specified information of the repository. Supported values: 
releases latest-release-tag latest-release-rev exclude-file exclusions src-dir rev-dir rev-hashfilepath rev-hashfilename head-dir head-image-dir  git-repo size
'
ARCV__OPTION_LIST_ARGS["repo"]="2" 
ARCV__OPTION_LIST_ARGS_TYPE["repo"]="INFONAME"
ARCV__OPTION_LIST_ACTI["repo"]='
ARCV__VARS["repo_info"]=true
ARCV__VARS["checkin"]=false
ARCV__VARS["repo_infoname"]=""
'
ARCV__OPTION_LIST_VALS["repo"]='
ARCV__VARS["repo_infoname"]="${__myarg}"
'
ARCV__OPTION_LIST_ENUM["repo"]='release-dir release-hooks releases latest-release-tag latest-release-rev exclude-file exclusions src-dir rev-dir rev-hashfilepath rev-hashfilename head-dir head-image-dir head-rev fetch-url git-repo size'



ARCV__OPTION_LIST_SDESC["-F|--fmt"]='Specifies the output format'

ARCV__OPTION_LIST_DESC["-F|--fmt"]='
Specifies the format of the output of a command. Possible values : "plain" for raw text without any color nor layout formatting. "adoc" for AsciiDoc format.

By default when no format is specified, the text may be colored and the text blocks may be arranged to be more readable.

At the moment, this option is only relevant for history logs and diffs. There is no effect if the format is not supported for the applied command
'
ARCV__OPTION_LIST_ARGS["-F|--fmt"]="0" 
ARCV__OPTION_LIST_ARGS_TYPE["-F|--fmt"]="'adoc' | 'plain'"
ARCV__OPTION_LIST_ACTI["-F|--fmt"]=""
ARCV__OPTION_LIST_VALS["-F|--fmt"]='
local lowArg="${__myarg}"
Str__toLower lowArg
ARCV__VARS["output_format"]="${lowArg}"
if ! Array__contains_by_string "${ARCV__OPTION_LIST_ENUM["-F|--fmt"]}" "$lowArg" ; then
    _susage "Invalid format ${__myarg}"
fi
'
ARCV__OPTION_LIST_ENUM["-F|--fmt"]='plain adoc'



ARCV__OPTION_LIST_SDESC["--from"]='Specify the most recent revision or release tag from which to start the operation'

ARCV__OPTION_LIST_DESC["--from"]='
Specifies the most recent revision or release tag from which to start the operation. A negative number N designates the Nth revision behind the head. At the moment, this option is only relevant for the history logs.
'
ARCV__OPTION_LIST_ARGS["--from"]="0" 
ARCV__OPTION_LIST_ARGS_TYPE["--from"]="(REVISION | RELEASE_TAG)"
ARCV__OPTION_LIST_ACTI["--from"]=""
ARCV__OPTION_LIST_VALS["--from"]='
ARCV__VARS["from_rev_or_tag"]="${__myarg}"
'


ARCV__OPTION_LIST_SDESC["--to"]='Specify the oldest revision or release tag until which to apply the operation'

ARCV__OPTION_LIST_DESC["--to"]='
Specifies the oldest revision or release tag until which to apply the operation. A negative number N designates the Nth revision behind the head. At the moment, this option is only relevant for the history logs.
'
ARCV__OPTION_LIST_ARGS["--to"]="0" 
ARCV__OPTION_LIST_ARGS_TYPE["--to"]="(REVISION | RELEASE_TAG)"
ARCV__OPTION_LIST_ACTI["--to"]=""
ARCV__OPTION_LIST_VALS["--to"]='
ARCV__VARS["to_rev_or_tag"]="${__myarg}"
'



ARCV__OPTION_LIST_SDESC["--fix"]="Fix SHA hashcode"
ARCV__OPTION_LIST_DESC["--fix"]="
This option enables to explicitly fix the SHA fingerprint aka hash code in case there's a mismatch between current source and the stored finger whilst no change was actually detected. This can be useful when the internal hash computation algorithm may change or could get anyhow broken because of an untested environment or an internal bug.
In any other case, this option has no effect.
"
ARCV__OPTION_LIST_ARGS["--fix"]="1"
ARCV__OPTION_LIST_ACTI["--fix"]='ARCV__VARS["fix-hash"]=true'



ARCV__OPTION_LIST_SDESC["changelog"]="Display the history log since last release"
ARCV__OPTION_LIST_DESC["changelog"]="
Display the history log since last release
"
ARCV__OPTION_LIST_ARGS["changelog"]="1"
ARCV__OPTION_LIST_ACTI["changelog"]='
ARCV__VARS["checkin"]=false
ARCV__VARS["revisionlog"]=true
ARCV__VARS["changelog"]=true
'


ARCV__OPTION_LIST_SDESC["--cm-cfg"]='Specifies a configuration parameter for the source in the repository'

ARCV__OPTION_LIST_DESC["--cm-cfg"]='
Specifies a configuration parameter for the source in the repository. 

The parameter will be stored in the YAML configuration associated with the source in the repository.
'
ARCV__OPTION_LIST_ARGS["--cm-cfg"]="0" 
ARCV__OPTION_LIST_ARGS_TYPE["--cm-cfg"]="YAML path assignment"
ARCV__OPTION_LIST_ACTI["--cm-cfg"]=""
ARCV__OPTION_LIST_VALS["--cm-cfg"]='
ARCV__VARS["cm-cfg"]="${__myarg}"
'


ARCV__OPTION_LIST_SDESC["--fetch"]="Update the current source folder with the data fetched from the URI specified with --source and initiate check-in"
ARCV__OPTION_LIST_DESC["--fetch"]="
Update the current source folder with the data fetched from the URI specified with --source and initiate check-in.

Note that if the URI was specified at very first commit (creation), it is not necessary to specify --source at subsequent check-ins, as the data will be implicitly fetched from that initial URI. 

This operation is only allowed for a check-in.
"
ARCV__OPTION_LIST_ARGS["--fetch"]="1"
ARCV__OPTION_LIST_ACTI["--fetch"]='ARCV__VARS["fetch-update"]=true'


ARCV__OPTION_LIST_SDESC["--fetch-only"]="Create or update a source folder that will contain the data fetched from the passed URI without committing the source folder"
ARCV__OPTION_LIST_DESC["--fetch-only"]="
Creates or updates a source folder that will contain the data fetched from the passed URI without committing the source folder.

This operation is only allowed at check-in, even though no actual check-in is initiated afterwards. 

This function is provided for convenience for just generating a standalone MongoDB dump with dealing with any revision control.
"
ARCV__OPTION_LIST_ARGS["--fetch-only"]="1"
ARCV__OPTION_LIST_ACTI["--fetch-only"]='
ARCV__VARS["fetch-update"]=true
ARCV__VARS["fetch-only"]=true
'



ARCV__OPTION_LIST_SDESC["push"]="Pushes data previously fetched to the URI specified with --source"
ARCV__OPTION_LIST_DESC["push"]="
Pushes data previously fetched to the URI specified with --source.
The data is grabed from the current source folder or the head in the repository. 

"
ARCV__OPTION_LIST_ARGS["push"]="2" #2:optional value
ARCV__OPTION_LIST_ARGS_TYPE["co"]="REVISION | RELEASE TAG"
ARCV__OPTION_LIST_ACTI["push"]='
ARCV__VARS["push"]=true
'
ARCV__OPTION_LIST_VALS["push"]='
ARCV__VARS["push-arg"]="$__myarg"
'


ARCV__OPTION_LIST_SDESC["--rm"]="Removes the created source after a direct fetch check-in"
ARCV__OPTION_LIST_DESC["--rm"]="
Removes the created source after a direct fetch check-in
A new revision can be created directly from an URI, without requiring an existing source folder, by fetching new data from the specified URI. In this process, a matching source folder is created in the current directory. This option enables to clean up the folder once the commit completed

"
ARCV__OPTION_LIST_ARGS["--rm"]="1"
ARCV__OPTION_LIST_ACTI["--rm"]='ARCV__VARS["remove-after-direct-fetch-commit"]=true'



ARCV__OPTION_LIST_SDESC["--cycle"]='Specifies the size of the revision ring for circular revisions'

ARCV__OPTION_LIST_DESC["--cycle"]='
Specifies the size of the revision ring for circular revisions, i.e. the number of revisions after which the revision number shall wrap around. 

When the cycle is a plain integer, the revision will wrap around starting from 0 again. 

Each saved revision contains all data, and not only the differences.

At wraparound, a new revision overwrites any previous one of the same number and thus gets lost.

When the cycle is an integer number following by '+', it additionally initiates a parallel cycle backup source in the repository. Each time is a cycle is completed, a new revision is created in the backup source duplicating the last cycle revision. The name of the cycle backup source is the original source to which '-cycle' is appended and is managed automatically.

A 0 cycle value means 'infinite' (implicit default value).

This option can only be specified at the initial commit.
'
ARCV__OPTION_LIST_ARGS["--cycle"]="0" 
ARCV__OPTION_LIST_ARGS_TYPE["--cycle"]="INTEGER[+]"
ARCV__OPTION_LIST_ACTI["--cycle"]=""
ARCV__OPTION_LIST_VALS["--cycle"]='

if [[ "${__myarg}" =~ ^([0-9]+)(\+?)$ ]] ; then
    ARCV__VARS["revision-cycle"]="${BASH_REMATCH[1]}"
    if Str__isEmpty "${BASH_REMATCH[2]}" ; then
        ARCV__VARS["cycle-save"]=false
    else
        ARCV__VARS["cycle-save"]=true
    fi
else
    _exit -1 "Invalid cycle ${__myarg}. It must be a positive integer optionally following by '+'."
fi
'



ARCV__OPTION_LIST_SDESC["--interval"]='Specifies the time interval in days, hours, minutes or seconds at which new revisions are allowed to be created'

ARCV__OPTION_LIST_DESC["--interval"]='
Specifies the time interval in days, hours, minutes or seconds at which new revisions are allowed to be created. For instance, if the value is 1h or 3600s, an attempt to commit a new revision will be rejected an hour after the last commit. A margin of +-10s is allowed.

An explicit value of 0 means there is no restriction (implicit default).

This option can only be specified at the initial commit and is usually used to enforce backup strategies.
'
ARCV__OPTION_LIST_ARGS["--interval"]="0" 
ARCV__OPTION_LIST_ARGS_TYPE["--interval"]="INTEGER[+]"
ARCV__OPTION_LIST_ACTI["--interval"]=""
ARCV__OPTION_LIST_VALS["--interval"]='

if [[ ! "${__myarg}" =~ ^([0-9]+)(d|h|m|s)$ ]] ; then
    _exit -1 "Invalid time interval ${__myarg}. It must be a positive integer following by any of the following: 'd' for days or 'h' for hours or 'm' for minutes or 's' for seconds."
fi
ARCV__VARS["revision-interval"]="${BASH_REMATCH[1]}"
local formula="${BASH_REMATCH[1]} * 1"
case "${BASH_REMATCH[2]}" in
    d) formula="${BASH_REMATCH[1]} * 3600 * 24" ;;
    h) formula="${BASH_REMATCH[1]} * 3600" ;;
    m) formula="${BASH_REMATCH[1]} * 60" ;;
    s) formula="${BASH_REMATCH[1]} * 1" ;;
    *) ;; # cannot happen
esac

Int__calc_r "${formula}" ARCV__VARS["revision-interval"] 
'


ARCV__OPTION_LIST_SDESC["--force"]="Force a commit even when no change was detected"
ARCV__OPTION_LIST_DESC["--force"]="
Forces a commit even when no change was detected
"
ARCV__OPTION_LIST_ARGS["--force"]="1"
ARCV__OPTION_LIST_ACTI["--force"]='ARCV__VARS["force-commit"]=true'



ARCV__OPTION_LIST_SDESC["--revive"]="Revive file from lastest version found in history when missing in head revision"
ARCV__OPTION_LIST_DESC["--revive"]="
Revives a file from the lastest version found in history when the file is missing in head revision. This option is only valid in the scope of a checkout operation.
"
ARCV__OPTION_LIST_ARGS["--revive"]="1"
ARCV__OPTION_LIST_ACTI["--revive"]='ARCV__VARS["revive"]=true'






ARCV__OPTION_LIST_SDESC["--files"]="Lists all the files used by the app (config, log etc)"
ARCV__OPTION_LIST_DESC["--files"]="
Lists the files used by the app, i.e. the configuration file, the log file, the dependency system package installation cache file
"
ARCV__OPTION_LIST_ARGS["--files"]="1"
ARCV__OPTION_LIST_ACTI["--files"]='
local file
if _getConfigFilePath file ; then
        echo "${file}"
fi

if _getLogPath file ; then
        echo "${file}"
fi

if _getDependenciesCacheFile file ; then
        echo "${file}"
fi

_quit ""
'

ARCV__OPTION_LIST_SDESC["--log"]="Show the log tail"
ARCV__OPTION_LIST_DESC["--log"]="
Show the log tail. By default, shows the last 40 lines and the number of lines specified as option value.
"
ARCV__OPTION_LIST_ARGS["--log"]="2"
ARCV__OPTION_LIST_ACTI["--log"]='
local _log=""

_getLogPath __log
tail -F "${__log}" -n 40
_quit ""
'
ARCV__OPTION_LIST_VALS["--log"]='
local __log
_getLogPath __log
tail -F "${__log}" -n "${__myarg}"
_quit ""
'

ARCV__OPTION_LIST_SDESC["--config"]="Show the configuration file content"
ARCV__OPTION_LIST_DESC["--config"]="
Shows the configuration file content
"
ARCV__OPTION_LIST_ARGS["--config"]="1"
ARCV__OPTION_LIST_ACTI["--config"]='
local file
if _getConfigFilePath file ; then
        echo "${file}:"
        cat "${file}"
        echo "END"
        _quit ""
else
        _exit -1 "Failed to retrieve configuration file path"

fi 
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
