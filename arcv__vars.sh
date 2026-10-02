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
# Release file path: arcv__vars.sh
# Release file date: 2026-10-02 03:17
# App version: 1.2.2
# App source revision: 333
# App source signature: 4bef88895387a0d0eede279d0ee2242c06b807782284f9c8142e0f677cdc65d5
# Source file last modification: 2026-09-30 16:48:11.172288564 +0200
#
# This header was generated. Do not modify.
#
# ------------------------------------------------------------------------------
#
# This file contains the definition of all internal variables used by TestApp.
# These variables may e.g. set by options and when reading data from a YAML file
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


ARCV__VARS["root-resolved"]=false

ARCV__VARS["backupsrc"]=""
ARCV__VARS["explicit_backupsrc"]=""
ARCV__VARS["backupsrcBasename"]=""
ARCV__VARS["backuptarget"]="$HOME/Archive"
ARCV__VARS["backupapptarget"]="$HOME/Archive"           # Example Archive/sumo/
ARCV__VARS["backupappversiontarget"]="$HOME/Archive"    # Example Archive/sumo/sumo.archive/

ARCV__VARS["backupapptargetrootfile"]=""
ARCV__VARS["backupapptargetexcludefile"]=""
ARCV__VARS["headversion"]=""                            # Points to the head revision folder
ARCV__VARS["headrev"]=""                                # Gives the revision number of the head
ARCV__VARS["droppedsrc"]=""

ARCV__VARS["changelog"]=false
ARCV__VARS["copy"]="rsync"
ARCV__VARS["copy_opt"]="-a -X --info=NAME1 --out-format=%n"
ARCV__VARS["copy_opt_intern"]="-a -X"
excludedFiles=()
ARCV__VARS["diff"]=false
ARCV__VARS["diff_rev"]="current"
ARCV__VARS["file_rev"]=""
ARCV__VARS["2nd_diff_rev"]=""
ARCV__VARS["invert_diff_arg"]=false
ARCV__VARS["rev"]=false
ARCV__VARS["list"]=false
ARCV__VARS["hash"]=false
ARCV__VARS["hash_folder"]=""
ARCV__VARS["meld"]=false
ARCV__VARS["git"]=false
ARCV__VARS["tarball"]=false
ARCV__VARS["verbose"]=false
ARCV__VARS["checkout"]=""
ARCV__VARS["checkout_folder"]=""
ARCV__VARS["checkout_folder_original"]=""
ARCV__VARS["checkin"]=true
ARCV__VARS["branch"]=""
ARCV__VARS["branch-root"]=""
ARCV__VARS["branch-root-rev"]=""
ARCV__VARS["publish"]=false
ARCV__VARS["publish-tag"]=""
ARCV__VARS["checkformodif"]=false
ARCV__VARS["export"]=false
ARCV__VARS["exp_folder"]=""
ARCV__VARS["exp_rev"]=""
ARCV__VARS["mountaccess"]=false

ARCV__VARS["storageViaNfs"]=""
ARCV__VARS["storage"]=""
ARCV__VARS["localHostName"]=""
ARCV__VARS["localHostMAC"]=""

ARCV__VARS["revisionlog"]=false
ARCV__VARS["revisionlog_file"]=""
ARCV__VARS["releaselog"]=false
ARCV__VARS["subproc"]=false
ARCV__VARS["log_message"]=""
ARCV__VARS["silent"]=false
ARCV__VARS["force-default-entry"]=false
ARCV__VARS["excluded_file_patterns"]=""
ARCV__VARS["repo_info"]=false
ARCV__VARS["repo_infoname"]=""
ARCV__VARS["destroy-repo"]=false
ARCV__VARS["check-in-list-only"]=false
ARCV__VARS["output_format"]=""
ARCV__VARS["fix-hash"]=false
ARCV__VARS["from_rev_or_tag"]=""
ARCV__VARS["to_rev_or_tag"]=""
ARCV__VARS["plain-output-mode"]=false

ARCV__VARS["paging"]=""
ARCV__VARS["hook"]=""
ARCV__VARS["releasehooks"]=false
