# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::scala::scalaenv::latest()
#
#>
######################################################################
p6df::modules::scala::scalaenv::latest() {

  scalaenv install -l | grep scala-2.1 | sed -e 's, ,,g' | sort | tail -1
}

######################################################################
#<
#
# Function: p6df::modules::scala::scalaenv::latest::installed()
#
#>
######################################################################
p6df::modules::scala::scalaenv::latest::installed() {

  scalaenv install -l | grep scala-2.1 | sed -e 's, ,,g' | sort | tail -2 | head -1
}
