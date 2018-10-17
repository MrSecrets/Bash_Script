cd
mkdir darknet_ws
cd darknet_ws
mkdir src
catkin_make
cd src
git clone https://github.com/leggedrobotics/darknet_ros.git
cd darknet_ros
git clone https://github.com/pjreddie/darknet.git
cd ../
cd ../
catkin_make -DCMAKE_BUILD_TYPE=Release
