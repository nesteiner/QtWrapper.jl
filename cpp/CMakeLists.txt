cmake_minimum_required(VERSION 3.15)
set(CMAKE_C_COMPILER "clang")
set(CMAKE_CXX_COMPILER "clang++")
#set(MOC_OUTPUT ${CMAKE_SOURCE_DIR}/src)
set(CMAKE_AUTOMOC ON)
project(libqt_wrapper)


find_package(Qt6 REQUIRED COMPONENTS Core Gui Widgets)

# qt_generate_moc(src/customwidget.cc ${MOC_OUTPUT}/moc_customwidget.cc)
qt_add_library(
    qt_wrapper
    lib.cc
    src/customwidget.cc
    # ${MOC_OUTPUT}/moc_customwidget.cc
)
target_sources(qt_wrapper PRIVATE lib.cc)
target_link_libraries(qt_wrapper PRIVATE Qt6::Core Qt6::Gui Qt6::Widgets)
install(TARGETS qt_wrapper LIBRARY DESTINATION ${CMAKE_SOURCE_DIR})