!#/bin/bash
#get root
if [[ ! "$EUID" == "0" ]]; then
  echo "Run as root pls"
  exit 1
fi
#get darling and wine

#wine
yay -S wine winetricks

#darling

    #get dependencies

pacman -S --needed make cmake clang flex bison icu fuse linux-headers gcc-multilib \
lib32-gcc-libs pkg-config fontconfig cairo libtiff python2 mesa llvm libbsd libxkbfile \ 
libxext libxkbcommon libxrandr

pacman -S linux-headers

    #download and install

git clone --recursive https://github.com/darlinghq/darling.git
cd darling
mkdir build && cd build
cmake ..
make
make install
make lkm
make lkm_install