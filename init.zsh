######################################################################
#<
#
# Function: p6df::modules::scala::deps()
#
#>
######################################################################
p6df::modules::scala::deps() {
  ModuleDeps=(
    p6m7g8/p6common
    scalaenv/scalaenv
  )
}

######################################################################
#<
#
# Function: p6df::modules::scala::external::brew()
#
#>
######################################################################
p6df::modules::scala::external::brew() {

}

######################################################################
#<
#
# Function: p6df::modules::scala::home::symlink()
#
#>
######################################################################
p6df::modules::scala::home::symlink() {

  # XXX: ENV move
}

######################################################################
#<
#
# Function: p6df::modules::scala::init()
#
#>
######################################################################
p6df::modules::scala::init() {

  p6df::modules::scala::scalaenv::init "$P6_DFZ_SRC_DIR"
}

######################################################################
#<
#
# Function: p6df::modules::scala::scalaenv::init(dir)
#
#  Args:
#	dir -
#
#>
######################################################################
p6df::modules::scala::scalaenv::init() {
  local dir="$1"

  [ -n "$DISABLE_ENVS" ] && return
  SCALAENV_ROOT=$dir/scalaenv/scalaenv

  if [ -x $SCALAENV_ROOT/bin/scalaenv ]; then
    export SCALAENV_ROOT
    export HAS_SCALAENV=1

    p6df::util::path_if $SCALAENV_ROOT/bin
    eval "$(p6_run_code scalaenv init - zsh)"
  fi
}

######################################################################
#<
#
# Function: p6df::modules::scala::prompt::line()
#
#>
######################################################################
p6df::modules::scala::prompt::line() {

  p6_scala_prompt_info
}

######################################################################
#<
#
# Function: p6_scala_prompt_info()
#
#>
######################################################################
p6_scala_prompt_info() {

  echo -n "scala:\t  "
  p6_lang_version "scala"
}
