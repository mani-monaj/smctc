cmake_minimum_required (VERSION 2.8.1)

project (smctc CXX)
find_package(PkgConfig)

pkg_check_modules(GSL gsl)
include_directories(${GSL_INCLUDE_DIRS})
link_directories(${GSL_LIBRARY_DIRS})

if(NOT DEFINED CMAKE_CXX_FLAGS)
  set(CMAKE_CXX_FLAGS "-g -std=c++0x")
endif()

include_directories(include)

set(SMCTC_HEADER_FILES
    include/smctc/history.hh
    include/smctc/mcmc.hh
    include/smctc/moveset.hh
    include/smctc/particle.hh
    include/smctc/rng.hh
    include/smctc/sampler.hh
    include/smctc/smc-exception.hh
    include/smctc/smctc.hh

)

set(SMCTC_SOURCE_FILES
  src/history.cc
  src/rng.cc
  src/smc-exception.cc)

add_library(smctc SHARED
            ${SMCTC_SOURCE_FILES})
target_link_libraries(smctc ${GSL_LIBRARIES})

install(TARGETS smctc
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
)

install(FILES ${SMCTC_HEADER_FILES}
  DESTINATION include/smctc
)
