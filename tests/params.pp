# File::      <tt>params.pp</tt>
# Author::    S. Varrette, H. Cartiaux, V. Plugaru (hpc-sysadmins@uni.lu)
# Copyright:: Copyright (c) 2014 S. Varrette, H. Cartiaux, V. Plugaru
# License::   Gpl-3.0
#
# ------------------------------------------------------------------------------
# You need the 'future' parser to be able to execute this manifest (that's
# required for the each loop below).
#
# Thus execute this manifest in your vagrant box as follows:
#
#      sudo puppet apply -t --parser future /vagrant/tests/params.pp
#
#

include 'sudo::params'

$names = ["ensure ", "packagename ", "configfile ", "backupconfigfile ", "configfile_mode ", "configfile_owner ", "configfile_group ", "configdir ", "configdir_mode ", "configdir_owner ", "configdir_group ", "check_syntax_name ", "cmdalias_pkgmanager "]

each($names) |$v| {
    $var = "sudo::params::${v}"
    notice("${var} = ", inline_template('<%= scope.lookupvar(@var) %>'))
}
