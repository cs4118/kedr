if(KERNEL_PART AND Kbuild_ARCH STREQUAL "arm64")
    install(CODE "execute_process(COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/disable_kaslr.sh)")
endif(KERNEL_PART AND Kbuild_ARCH STREQUAL "arm64")
