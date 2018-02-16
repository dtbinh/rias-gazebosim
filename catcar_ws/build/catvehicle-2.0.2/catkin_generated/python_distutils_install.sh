#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/mupasa/Research/rias-gazebosim/catcar_ws/src/catvehicle-2.0.2"

# snsure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/mupasa/Research/rias-gazebosim/catcar_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/mupasa/Research/rias-gazebosim/catcar_ws/install/lib/python2.7/dist-packages:/home/mupasa/Research/rias-gazebosim/catcar_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/mupasa/Research/rias-gazebosim/catcar_ws/build" \
    "/usr/bin/python" \
    "/home/mupasa/Research/rias-gazebosim/catcar_ws/src/catvehicle-2.0.2/setup.py" \
    build --build-base "/home/mupasa/Research/rias-gazebosim/catcar_ws/build/catvehicle-2.0.2" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/mupasa/Research/rias-gazebosim/catcar_ws/install" --install-scripts="/home/mupasa/Research/rias-gazebosim/catcar_ws/install/bin"
