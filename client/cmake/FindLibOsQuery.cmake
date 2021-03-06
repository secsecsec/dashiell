# - find libosquery
# LIBOSQUERY_INCLUDE_DIR - Where to find libosquery header files (directory)
# LIBOSQUERY_LIBRARIES - libosquery libraries
# LIBOSQUERY_LIBRARY_RELEASE - Where the release library is
# LIBOSQUERY_LIBRARY_DEBUG - Where the debug library is
# LIBOSQUERY_FOUND - Set to TRUE if we found everything (library, includes and executable)

# Copyright (c) 2015 Norm MacLennan, <norm.maclennan@gmail.com>
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.
#
# Generated by CModuler, a CMake Module Generator - http://gitorious.org/cmoduler

IF( LIBOSQUERY_INCLUDE_DIR AND LIBOSQUERY_LIBRARY_RELEASE AND LIBOSQUERY_LIBRARY_DEBUG )
    SET(LIBOSQUERY_FIND_QUIETLY TRUE)
ENDIF( LIBOSQUERY_INCLUDE_DIR AND LIBOSQUERY_LIBRARY_RELEASE AND LIBOSQUERY_LIBRARY_DEBUG )

FIND_PATH( LIBOSQUERY_INCLUDE_DIR osquery/core.h )

FIND_LIBRARY(LIBOSQUERY_LIBRARY_RELEASE NAMES osquery_basic osquery_additional )

IF( LIBOSQUERY_LIBRARY_RELEASE OR LIBOSQUERY_LIBRARY_DEBUG AND LIBOSQUERY_INCLUDE_DIR )
	SET( LIBOSQUERY_FOUND TRUE )
ENDIF( LIBOSQUERY_LIBRARY_RELEASE OR LIBOSQUERY_LIBRARY_DEBUG AND LIBOSQUERY_INCLUDE_DIR )

IF( LIBOSQUERY_LIBRARY_DEBUG AND LIBOSQUERY_LIBRARY_RELEASE )
	# if the generator supports configuration types then set
	# optimized and debug libraries, or if the CMAKE_BUILD_TYPE has a value
	IF( CMAKE_CONFIGURATION_TYPES OR CMAKE_BUILD_TYPE )
		SET( LIBOSQUERY_LIBRARIES optimized ${LIBOSQUERY_LIBRARY_RELEASE} debug ${LIBOSQUERY_LIBRARY_DEBUG} )
	ELSE( CMAKE_CONFIGURATION_TYPES OR CMAKE_BUILD_TYPE )
    # if there are no configuration types and CMAKE_BUILD_TYPE has no value
    # then just use the release libraries
		SET( LIBOSQUERY_LIBRARIES ${LIBOSQUERY_LIBRARY_RELEASE} )
	ENDIF( CMAKE_CONFIGURATION_TYPES OR CMAKE_BUILD_TYPE )
ELSEIF( LIBOSQUERY_LIBRARY_RELEASE )
	SET( LIBOSQUERY_LIBRARIES ${LIBOSQUERY_LIBRARY_RELEASE} )
ELSE( LIBOSQUERY_LIBRARY_DEBUG AND LIBOSQUERY_LIBRARY_RELEASE )
	SET( LIBOSQUERY_LIBRARIES ${LIBOSQUERY_LIBRARY_DEBUG} )
ENDIF( LIBOSQUERY_LIBRARY_DEBUG AND LIBOSQUERY_LIBRARY_RELEASE )

IF( LIBOSQUERY_FOUND )
	IF( NOT LIBOSQUERY_FIND_QUIETLY )
		MESSAGE( STATUS "Found libosquery header file in ${LIBOSQUERY_INCLUDE_DIR}")
		MESSAGE( STATUS "Found libosquery libraries: ${LIBOSQUERY_LIBRARIES}")
	ENDIF( NOT LIBOSQUERY_FIND_QUIETLY )
ELSE(LIBOSQUERY_FOUND)
	IF( LIBOSQUERY_FIND_REQUIRED)
		MESSAGE( FATAL_ERROR "Could not find libosquery" )
	ELSE( LIBOSQUERY_FIND_REQUIRED)
		MESSAGE( STATUS "Optional package libosquery was not found" )
	ENDIF( LIBOSQUERY_FIND_REQUIRED)
ENDIF(LIBOSQUERY_FOUND)
