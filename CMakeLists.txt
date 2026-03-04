cmake_minimum_required(VERSION 3.16)
project(lib_gateway_tcp VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# --- Dependencies ---
find_package(Boost REQUIRED COMPONENTS system)
find_package(Protobuf REQUIRED)
find_library(B64_LIBRARIES b64 REQUIRED)

# --- Library target ---
add_library(tcp_gateway SHARED
    src/tcp_client.cpp
    src/tcp_server.cpp
    src/tcp_session.cpp
)

target_include_directories(tcp_gateway
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
    PRIVATE
        ${Protobuf_INCLUDE_DIRS}
)

target_link_libraries(tcp_gateway
    PUBLIC
        Boost::system
        ${Protobuf_LIBRARIES}
        ${B64_LIBRARIES}
)

set_target_properties(tcp_gateway PROPERTIES
    VERSION ${PROJECT_VERSION}
    SOVERSION 1
)

# --- Install rules ---
include(GNUInstallDirs)
install(TARGETS tcp_gateway
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
install(DIRECTORY include/lib_gateway_tcp
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

# --- CMake package export so find_package() works ---
include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

install(TARGETS tcp_gateway
    EXPORT tcp_gatewayTargets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

install(DIRECTORY include/lib_gateway_tcp
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

install(EXPORT tcp_gatewayTargets
    FILE tcp_gatewayTargets.cmake
    NAMESPACE tcp_gateway::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/tcp_gateway
)

configure_package_config_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/cmake/tcp_gatewayConfig.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/tcp_gatewayConfig.cmake
    INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/tcp_gateway
)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/tcp_gatewayConfig.cmake
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/tcp_gateway
)
