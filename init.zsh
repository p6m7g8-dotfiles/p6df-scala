p6df::modules::scala::version() { echo "0.0.1" }
p6df::modules::scala::deps()    {
	ModuleDeps=(
	)
}

p6df::modules::scala::external::brew() {

}

p6df::modules::scala::home::symlink() {

  # XXX: ENV move
}

p6df::modules::scala::init() {

  p6df::modules::scala::scalaenv::init "$P6_DFZ_SRC_DIR"
}

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

p6df::prompt::scala::line() {

  p6_scala_prompt_info
}

p6_scala_prompt_info() {

  p6_lang_version "scala"
}
