######################################################################
#<
#
# Function: p6df::modules::scala::version()
#
#>
######################################################################
p6df::modules::scala::version() { echo "0.0.1" }
######################################################################
#<
#
# Function: p6df::modules::scala::deps()
#
#>
######################################################################
p6df::modules::scala::deps()    {
	ModuleDeps=(
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
      eval "$(scalaenv init - zsh)"
    fi
}

######################################################################
#<
#
# Function: p6df::prompt::scala::line()
#
#>
######################################################################
p6df::prompt::scala::line() {

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

  p6_lang_version "scala"
}