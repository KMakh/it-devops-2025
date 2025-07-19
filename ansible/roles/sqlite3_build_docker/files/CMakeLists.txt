cmake_minimum_required(VERSION 3.23)
project(sqlite3 LANGUAGES C)

set(SQLITE_SRC_DIR ${PROJECT_SOURCE_DIR}/sqlite-amalgamation-3260000)

add_library(sqlite3 SHARED
    ${SQLITE_SRC_DIR}/sqlite3.c
)

target_include_directories(sqlite3
    PUBLIC
        ${SQLITE_SRC_DIR}
)

install(
    TARGETS sqlite3
    LIBRARY DESTINATION lib
    INCLUDES DESTINATION include
)
