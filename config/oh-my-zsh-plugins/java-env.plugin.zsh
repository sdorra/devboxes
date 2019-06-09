switch-java () {
  VERSION="${1}"
  if [ -n "${VERSION}" ]; then
    DIRECTORIES=(
      "/usr/lib/jvm/java-1.${VERSION}.0-openjdk-amd64"
      "/usr/lib/jvm/java-${VERSION}-openjdk"
    )
    NEW_HOME=""
    for DIRECTORY in ${DIRECTORIES}; do
      if [ -d "${DIRECTORY}" ]; then
        NEW_HOME="${DIRECTORY}"
        break
      fi
    done
    if [ ! -n "${NEW_HOME}" ]; then
      echo "java version ${VERSION} is not installed"
    else
      JAVA_HOME="${NEW_HOME}"
    fi
  else
    echo "usage switch-java version"
  fi
}
