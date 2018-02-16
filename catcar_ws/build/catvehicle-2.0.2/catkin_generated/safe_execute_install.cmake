execute_process(COMMAND "/home/mupasa/Research/ROSMAT/catcar_ws/build/catvehicle-2.0.2/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/mupasa/Research/ROSMAT/catcar_ws/build/catvehicle-2.0.2/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
