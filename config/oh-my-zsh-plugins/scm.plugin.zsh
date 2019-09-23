scm-root () {
  ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
  if [ "$?" != 0 ]; then
    ROOT=$(hg root 2>/dev/null)
    if [ "$?" != 0 ]; then
      ROOT=$(svn info . --show-item wc-root --no-newline 2>/dev/null)
    fi
  fi
  if [ -z "${ROOT}" ]; then
    echo "no repository root found"
    return 1
  else
    cd "${ROOT}"
  fi
}
