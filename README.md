# lib_gateway_tcp

A lightweight TCP client/server library for protobuf-based communication between robotic systems. Provides bidirectional, serialized message passing over TCP using Protocol Buffers and base64 encoding.

Originally adopted from [GobySoft's NETSIM Libraries](https://github.com/GobySoft/netsim) (Toby Schneider) and modified for the MIT Marine Robotics gateway system by Supun Randeni and Michael DeFilippo, MIT Department of Mechanical Engineering.

Used by:
- [moos-ivp-gateway](https://github.com/mikedef/moos-ivp-gateway) — MOOS-IvP TCP gateway and client
- [protobuf_client_ros2](https://github.com/mikedef/protobuf_client_ros2) — ROS 2 TCP client node

---

## Dependencies
```bash
sudo apt install libboost-all-dev libprotobuf-dev protobuf-compiler libb64-dev
```

## Build and Install
```bash
git clone https://github.com/YOUR_ORG/lib_gateway_tcp.git
cd lib_gateway_tcp
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j$(nproc)
sudo make install
```

This installs:
- `libtcp_gateway.so` → `/usr/local/lib/`
- Headers → `/usr/local/include/lib_gateway_tcp/`
- CMake package config → `/usr/local/lib/cmake/tcp_gateway/`

---

## Usage in CMake Projects
```cmake
find_package(tcp_gateway REQUIRED)

target_link_libraries(your_target
    tcp_gateway
)
```
```cpp
#include "lib_gateway_tcp/tcp_client.h"
#include "lib_gateway_tcp/tcp_server.h"
```

---

## Updating the Library

When pulling a new version, rebuild and reinstall:
```bash
cd lib_gateway_tcp/build
git pull
cmake ..
make -j$(nproc)
sudo make install
```

Then rebuild any consumer packages normally.

---

## License

The TCP session/client/server code is derived from GobySoft's NETSIM libraries and retains the original copyright. See individual source file headers for full attribution.

Modifications copyright (c) 2022-2025 Massachusetts Institute of Technology.
Authors: Supun Randeni, Michael DeFilippo

For licensing inquiries: tlo@mit.edu
