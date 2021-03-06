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
  previous=$(scalaenv install -l | grep scala-2.1 | sed -e 's, ,,g' | sort | tail -2 | head -1)
  scalaenv uninstall -f $previous

  local latest
  latest=$(scalaenv install -l | grep scala-2.1 | sed -e 's, ,,g' | sort | tail -1)
  scalaenv install -f $latest
  scalaenv global $latest
  scalaenv rehash
}

######################################################################
#<
#
# Function: p6df::modules::scala::init()
#
#  Environment:	 P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::scala::init() {

  p6df::modules::scala::scalaenv::init "$P6_DFZ_SRC_DIR"

  p6df::modules::scala::prompt::init
}

######################################################################
#<
#
# Function: p6df::modules::scala::prompt::init()
#
#>
######################################################################
p6df::modules::scala::prompt::init() {

  p6df::core::prompt::line::add "p6_lang_prompt_info"
  p6df::core::prompt::line::add "p6_lang_envs_prompt_info"

  p6df::core::prompt::lang::line::add scala
}

######################################################################
#<
#
# Function: p6df::modules::scala::scalaenv::init(dir)
#
#  Args:
#	dir -
#
#  Environment:	 DISABLE_ENVS HAS_SCALAENV SCALAENV_ROOT
#>
######################################################################
p6df::modules::scala::scalaenv::init() {
  local dir="$1"

  [ -n "$DISABLE_ENVS" ] && return
  SCALAENV_ROOT=$dir/scalaenv/scalaenv

  if [ -x $SCALAENV_ROOT/bin/scalaenv ]; then
    export SCALAENV_ROOT
    export HAS_SCALAENV=1

    p6_path_if $SCALAENV_ROOT/bin
    eval "$(p6_run_code scalaenv init - zsh)"
  fi
}

######################################################################
#<
#
# Function: str str = p6_scala_env_prompt_info()
#
#  Returns:
#	str - str
#
#  Environment:	 SCALAENV_ROOT
#>
######################################################################
p6_scala_env_prompt_info() {

  local str="scalaenv_root:\t  $SCALAENV_ROOT"

  p6_return_str "$str"
}
