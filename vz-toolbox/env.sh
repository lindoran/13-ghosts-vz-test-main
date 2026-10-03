# Source this file from the toolbox directory or by absolute path:
#   . /path/to/vz-toolbox/env.sh      (works in bash, zsh and dash/sh)
# In plain sh, set VZ_TOOLBOX yourself first if you source it by a relative path
# from another directory.
if [ -n "${BASH_VERSION:-}" ]; then
  _vz_src="${BASH_SOURCE:-$0}"
elif [ -n "${ZSH_VERSION:-}" ]; then
  _vz_src="${(%):-%x}"
else
  _vz_src="$0"
fi
if [ -z "${VZ_TOOLBOX:-}" ]; then
  VZ_TOOLBOX="$(cd "$(dirname "$_vz_src")" 2>/dev/null && pwd)"
fi
unset _vz_src
if [ ! -x "$VZ_TOOLBOX/bin/vzpack" ]; then
  echo "env.sh: cannot locate toolbox (looked in '$VZ_TOOLBOX')." >&2
  echo "        In plain sh, run:  VZ_TOOLBOX=/path/to/vz-toolbox . /path/to/vz-toolbox/env.sh" >&2
  return 1 2>/dev/null || exit 1
fi
export VZ_TOOLBOX
export PATH="$VZ_TOOLBOX/bin:$PATH"
# for the 13-ghosts Makefile, which hardcodes /home/david/... paths
export VZPACK="$VZ_TOOLBOX/bin/vzpack"
export VZ2WAV="$VZ_TOOLBOX/bin/vz2wav"
