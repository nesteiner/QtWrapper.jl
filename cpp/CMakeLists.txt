cmake_minimum_required(VERSION 3.15)



option(ENABLE_DEBUG "enable memory leak detection with address sanitizer" OFF)

if (ENABLE_DEBUG)
    # 启用 AddressSanitizer
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -fsanitize=address -fno-omit-frame-pointer")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g -fsanitize=address -fno-omit-frame-pointer")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fsanitize=address")
    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -fsanitize=address")
    message(STATUS "enable memory leak detection with address sanitizer")
else()
    message(STATUS "memory leak not enable")
endif()

set(CMAKE_C_COMPILER "clang")
set(CMAKE_CXX_COMPILER "clang++")
#set(MOC_OUTPUT ${CMAKE_SOURCE_DIR}/src)
set(CMAKE_AUTOMOC ON)
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=address  -fsanitize-recover=address -fno-stack-protector -fno-omit-frame-pointer")
project(libqt_wrapper)


find_package(Qt6 REQUIRED COMPONENTS Core Gui Widgets)

# qt_generate_moc(src/customwidget.cc ${MOC_OUTPUT}/moc_customwidget.cc)
qt_add_library(
    qt_wrapper
    lib.cc
    src/widgets/customwidget.cc
    # ${MOC_OUTPUT}/moc_customwidget.cc
)
target_sources(qt_wrapper PRIVATE lib.cc)
target_link_libraries(qt_wrapper PRIVATE Qt6::Core Qt6::Gui Qt6::Widgets)
install(TARGETS qt_wrapper LIBRARY DESTINATION ${CMAKE_SOURCE_DIR})

add_executable(test_executable test.cc)
target_link_libraries(test_executable PRIVATE qt_wrapper Qt6::Core Qt6::Gui Qt6::Widgets)
# 添加测试
add_test(NAME test_qt_wrapper COMMAND test_executable)

# 添加一个自定义目标，方便手动运行测试
add_custom_target(test
    COMMAND test_executable
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
    COMMENT "Running test_executable..."
)