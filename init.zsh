# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::scala::deps()
#
#>
######################################################################
p6df::modules::scala::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6common
    scalaenv/scalaenv
  )
}

######################################################################
#<
#
# Function: p6df::modules::scala::langs()
#
#>
######################################################################
p6df::modules::scala::langs() {

  local previous
  previous=$(p6df::modules::scala::scalaenv::latest::installed)
  scalaenv uninstall -f $previous

  local latest
  latest=$(p6df::modules::scala::scalaenv::latest)
  scalaenv install -f $latest
  scalaenv global $latest
  scalaenv rehash

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::scala::init(_module, dir)
#
#  Args:
#	_module -
#	dir -
#
#  Environment:	 P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::scala::init() {
  local _module="$1"
  local dir="$2"

  p6_bootstrap "$dir"

  p6df::core::lang::mgr::init "$P6_DFZ_SRC_DIR/scalaenv/scalaenv" "scala"

  p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::scala::env::prompt::info()
#
#  Returns:
#	str - str
#
#  Environment:	 SCALAENV_ROOT
#>
######################################################################
p6df::modules::scala::env::prompt::info() {

  local str="scalaenv_root:\t  $SCALAENV_ROOT"

  p6_return_str "$str"
}
