# install opencv

cd
sudo apt-get update -y
sudo apt-get upgrade -y

# remove previous files
sudo apt-get remove x264 libx264-dev -y

# install dependencies
sudo apt-get install build-essential checkinstall cmake pkg-config yasm -y
sudo apt-get install git gfortran -y 
sudo apt-get install libjpeg8-dev libjasper-dev libpng12-dev -y

# 
sudo apt-get install libtiff5-dev -y
 
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev -y
sudo apt-get install libxine2-dev libv4l-dev -y
sudo apt-get install libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev -y
sudo apt-get install qt5-default libgtk2.0-dev libtbb-dev -y
sudo apt-get install libatlas-base-dev -y
sudo apt-get install libfaac-dev libmp3lame-dev libtheora-dev -y
sudo apt-get install libvorbis-dev libxvidcore-dev -y
sudo apt-get install libopencore-amrnb-dev libopencore-amrwb-dev -y
sudo apt-get install x264 v4l-utils -y

# Optional dependencies
sudo apt-get install libprotobuf-dev protobuf-compiler -y
sudo apt-get install libgoogle-glog-dev libgflags-dev -y
sudo apt-get install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen -y

sudo apt-get install python-dev python-pip python3-dev python3-pip -y
sudo -H pip2 install -U pip numpy
sudo -H pip3 install -U pip numpy

# Install virtual environment
# sudo pip2 install virtualenv virtualenvwrapper
sudo pip3 install virtualenv virtualenvwrapper
echo "# Virtual Environment Wrapper"  >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
source ~/.bashrc



# ############ For Python 2 ############
# mkvirtualenv facecourse-py2 -p python2
# workon facecourse-py2
 # pip install numpy scipy matplotlib scikit-image scikit-learn ipython
# deactivate
# ######################################
  
############ For Python 3 ############
mkvirtualenv facecourse-py3 -p python3
workon facecourse-py3
pip install numpy scipy matplotlib scikit-image scikit-learn ipython
deactivate
######################################


# download opencv github

git clone https://github.com/opencv/opencv.git
cd opencv 
git checkout 3.3.1 
cd ..
git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout 3.3.1
cd ..



# build directory
cd opencv
mkdir build
cd build


# run cmake
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON ..


#  compile and install
# find out number of CPU cores in your machine
nproc
# substitute 4 by output of nproc
sudo make -j$(nproc)
sudo make install
sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig
