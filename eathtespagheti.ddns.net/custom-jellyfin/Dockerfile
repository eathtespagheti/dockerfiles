FROM jellyfin/jellyfin
# Enable non free packages
# RUN sed -i '/^deb/ s/$/ non-free/' /etc/apt/sources.list 
# RUN apt install vainfo intel-media-va-driver-non-free -y
RUN apt update -y
RUN apt upgrade -y
RUN apt install wget -y
RUN wget https://github.com/intel/compute-runtime/releases/download/21.10.19208/intel-gmmlib_20.3.2_amd64.deb \
         https://github.com/intel/intel-graphics-compiler/releases/download/igc-1.0.6410/intel-igc-core_1.0.6410_amd64.deb \
         https://github.com/intel/intel-graphics-compiler/releases/download/igc-1.0.6410/intel-igc-opencl_1.0.6410_amd64.deb \
         https://github.com/intel/compute-runtime/releases/download/21.10.19208/intel-opencl_21.10.19208_amd64.deb \
         https://github.com/intel/compute-runtime/releases/download/21.10.19208/intel-ocloc_21.10.19208_amd64.deb \
         https://github.com/intel/compute-runtime/releases/download/21.10.19208/intel-level-zero-gpu_1.0.19208_amd64.deb \
         https://github.com/intel/compute-runtime/releases/download/21.10.19208/ww10.sum
RUN sha256sum -c ww10.sum
RUN dpkg -i *.deb
RUN rm *.deb
RUN apt remove wget -y
ENV LIBVA_DRIVER_NAME=iHD