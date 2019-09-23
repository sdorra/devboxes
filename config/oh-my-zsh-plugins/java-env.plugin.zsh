switch-java() {
  VERSION="${1}"
  if [ -n "${VERSION}" ]; then
    NEW_HOME=""
    if [ -f "/usr/libexec/java_home" ]; then
      NEW_HOME=$(osx_java_home "${VERSION}")
    else
      NEW_HOME=$(linux_java_home "${VERSION}")
    fi
    if [ $? != 0 ]; then
      echo "java version ${VERSION} is not installed"
    elif [ ! -n "${NEW_HOME}" ]; then
      echo "java version ${VERSION} is not installed"
    else
      echo "switching to java ${NEW_HOME}"
      PATH=$(create_path "${NEW_HOME}")
      JAVA_HOME="${NEW_HOME}"
      java -version
    fi
  else
    echo "usage switch-java version"
  fi
}

create_path() {
  echo -n "${1}/bin"
  segments=("${(@s/:/)PATH}")
  for segment in "${segments[@]}"; do
    if [ "${segment}" != "${JAVA_HOME}/bin" ]; then
      echo -n ":${segment}"
    fi
  done
}

osx_java_home() {
  VERSION="${1}"
  if (( $VERSION > 2 && $VERSION < 9)); then
    VERSION="1.${1}"
  fi
  /usr/libexec/java_home -v "${VERSION}"
}

linux_java_home() {
  VERSION="${1}"
  DIRECTORIES=(
    "/usr/lib/jvm/java-1.${VERSION}.0-openjdk-amd64"
    "/usr/lib/jvm/java-${VERSION}-openjdk"
  )
  for DIRECTORY in ${DIRECTORIES}; do
    if [ -d "${DIRECTORY}" ]; then
      echo "${DIRECTORY}"
      break
    fi
  done
}
