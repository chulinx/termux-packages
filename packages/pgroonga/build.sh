TERMUX_PKG_HOMEPAGE=https://github.com/pgroonga/pgroonga
TERMUX_PKG_DESCRIPTION="A PostgreSQL extension to use Groonga as index"
TERMUX_PKG_LICENSE="PostgreSQL"
TERMUX_PKG_LICENSE_FILE="COPYING"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="4.0.1"
TERMUX_PKG_SRCURL=https://github.com/pgroonga/pgroonga/releases/download/${TERMUX_PKG_VERSION}/pgroonga-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=e2dfe40f3a0342e9ce4f1212043c46564fda3678e8cfda8587bbc37b103ebd17
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_DEPENDS="groonga, libmsgpack, xxhash"
TERMUX_PKG_BUILD_DEPENDS="postgresql"
TERMUX_PKG_EXTRA_MAKE_ARGS="
HAVE_MSGPACK=1
HAVE_XXHASH=1
MSGPACK_PACKAGE_NAME=msgpack-c
PG_CONFIG=${TERMUX_PREFIX}/bin/pg_config
"

termux_step_pre_configure() {
	# CMake files are broken
	mv CMakeLists.txt{,.unused}
}
