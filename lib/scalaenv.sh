# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::scala::scalaenv::latest()
#
#>
######################################################################
p6df::modules::scala::scalaenv::latest() {

  scalaenv install -l | p6_filter_row_select "scala-2.1" | p6_filter_strip_spaces | p6_filter_sort | p6_filter_row_last 1
}

######################################################################
#<
#
# Function: p6df::modules::scala::scalaenv::latest::installed()
#
#>
######################################################################
p6df::modules::scala::scalaenv::latest::installed() {

  scalaenv install -l | p6_filter_row_select "scala-2.1" | p6_filter_strip_spaces | p6_filter_sort | p6_filter_row_last 2 | p6_filter_row_first 1
}
