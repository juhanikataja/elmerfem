# Use CPack only if it really found
IF(EXISTS "${CMAKE_ROOT}/Modules/CPack.cmake")
  SET(CPACK_PACKAGE_NAME "ElmerFEM-7.0")
  SET(CPACK_PACKAGE_DESCRIPTION "TODO: Check what is package description ElmerFEM")
  SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "TODO: ElmerFEM - The Visualization Toolkit")

  SET(CPACK_PACKAGE_FILE_NAME "elmerfem-7.0_${CMAKE_SYSTEM_NAME}-${CMAKE_SYSTEM_PROCESSOR}")
  SET(CPACK_PACKAGE_VENDOR "TODO: CSC")
  SET(CPACK_PACAKGE_VERSION "${ELMER_FEM_MAJOR_VERSION}.${ELMER_FEM_MINOR_VERSION}")
  SET(CPACK_PACKAGE_VERSION_MAJOR "${ELMER_FEM_MAJOR_VERSION}")
  SET(CPACK_PACKAGE_VERSION_MINOR "${ELMER_FEM_MINOR_VERSION}")
  SET(CPACK_PACKAGE_CONTACT "TODO:elmeradm@csc.fi")

  #SET(CPACK_PACKAGE_DESCRIPTION_FILE "${CMAKE_CURRENT_SOURCE_DIR}/Copyright.txt")
  #SET(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/Copyright.txt")

  IF(CMAKE_SYSTEM_NAME MATCHES "Linux")
    SET(CPACK_GENERATOR "TGZ")
    IF(MAKE_DEB_PACKAGE)
      SET(CPACK_GENERATOR "${CPACK_GENERATOR};DEB")
    ENDIF()
    IF(MAKE_RPM_PACKAGE)  # TODO: untested
      SET(CPACK_GENERATOR "${CPACK_GENERATOR};RPM")
    ENDIF()
  ENDIF()

  IF(CMAKE_SYSTEM_NAME MATCHES "Windows")
    SET(CPACK_GENERATOR "NSIS;ZIP")
  ENDIF()


  IF(WIN32)
    SET(CPACK_NSIS_DISPLAY_NAME "${CPACK_PACKAGE_INSTALL_DIRECTORY}")
    SET(CPACK_NSIS_HELP_LINK "TODO: http://www.elmerfem.org")
    SET(CPACK_NSIS_CONTACT "TODO: elmeradm@csc.fi")
  ENDIF(WIN32)

  SET(CPACK_INSTALL_CMAKE_PROJECTS "${CMAKE_BINARY_DIR}" "Elmer" "ALL" "/")
  MESSAGE(STATUS "CPACK_PACKAGE_FILE_NAME : " ${CPACK_PACKAGE_FILE_NAME})
  INCLUDE(CPack)
ENDIF()
