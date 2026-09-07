Changes to apply when changing version:

- VERSION.txt: validate version number

- CHANGELOG

- Define shell api dependency
  * To use latest version of shellapi:
      unset SHELLAPI_VERSION    # to be sure var is not defined
      <generate a release of shellapi> 
  * To use a version of shellapi different of the current one e.g. v1.1.2 (change to the actual version number):
      export SHELLAPI_VERSION=1.1-2

- Generate a release :
    make release'
  The following updates are done automatically:
  * man page (man make target)
  * via "update_vernum_in_files":
    [x] install_arcv.sh: updated version numbers incl. dependencies
    [x] pack/debian/control : update dependency version
    [x] arcv_version.adoc in "developertoolsforlinux/pages/_topics/arcv/" of website
  * updates download page (web_download make target)
  NOTE: since some files may be updated:
    av -y
    make release

- Run all tests

- Tag the release once the release has been successfully tested:
    av pub
    The following updates are done automatically if 'av hook tools/update-web.sh' was called
    * online documentation update
      [x] make web is called
      [x] web site page are regenerated using make gensiten (release)

- Export the release to GitHub, for example (change to the actual version number):
    av export ../release/arcv/arcv-1.2-0
    
- Create the tag and related release in GitHub

