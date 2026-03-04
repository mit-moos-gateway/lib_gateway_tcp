#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "tcp_gateway::tcp_gateway" for configuration "Release"
set_property(TARGET tcp_gateway::tcp_gateway APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(tcp_gateway::tcp_gateway PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libtcp_gateway.so.1.0.0"
  IMPORTED_SONAME_RELEASE "libtcp_gateway.so.1"
  )

list(APPEND _cmake_import_check_targets tcp_gateway::tcp_gateway )
list(APPEND _cmake_import_check_files_for_tcp_gateway::tcp_gateway "${_IMPORT_PREFIX}/lib/libtcp_gateway.so.1.0.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
