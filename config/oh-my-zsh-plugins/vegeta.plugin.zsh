# vegeta quick
vq () {
  TARGET="${1}"
  DURATION="${2}"
  RATE="${3}"

  SHOW_HELP=false
  for arg in "$@"; do
    if [ "${arg}" = "-h" ] || [ "${arg}" = "--help" ]; then
      SHOW_HELP=true
    fi
  done

  if [ "${TARGET}" = "" ] || ${SHOW_HELP}; then
    echo "usage vq target [duration rate]"
    echo "for example:"
    echo "  vq https://example.org 5s 10"
    echo ""
  else
    echo "start vegeta with a rate of ${RATE}/1s for ${DURATION}"
    echo "---"
    echo "GET ${TARGET}" | vegeta attack -duration=${DURATION} -rate=${RATE} | vegeta report
  fi
}
