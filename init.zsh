p6df::modules::scala::version() { echo "0.0.1" }
p6df::modules::scala::deps()    {
	ModuleDeps=(
	)
}

p6df::modules::scala::external::brew() {
}

p6df::modules::scala::init() {

  p6df::modules::scala::scalaenv::init
}

p6df::modules::scala::scalaenv::init() {
    [ -n "$DISABLE_ENVS" ] && return

    SCALAENV_ROOT=/Users/pgollucci/.local/share/scalaenv/scalaenv

    if [ -x $SCALAENV_ROOT/bin/scalaenv ]; then
      export SCALENV_ROOT
      export HAS_SCALAENV=1

      p6dfz::util::path_if $SCALAENV_ROOT/bin
      eval "$(scalaenv init - zsh)"
    fi
}

p6df::prompt::scala::line() {

  env_version "scala"
}
