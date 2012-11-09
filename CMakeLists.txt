cmake_minimum_required (VERSION 2.8.1)
cmake_policy(SET CMP0015 NEW)

project (smctc CXX)

set(CMAKE_CXX_FLAGS "-g -std=c++0x -Wall")

include_directories(include)

set(SMCTC_SOURCE_FILES 
  src/history.cc
  src/rng.cc
  src/smc-exception.cc)

ADD_LIBRARY(smctc STATIC
            ${SMCTC_SOURCE_FILES})