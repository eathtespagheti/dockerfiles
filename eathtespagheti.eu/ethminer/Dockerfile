FROM debian:sid as build
ARG VERSION=v0.19.0
RUN apt-get update
RUN apt-get install -y build-essential git cmake mesa-common-dev
RUN git clone https://github.com/ethereum-mining/ethminer.git /ethminer
RUN git -C /ethminer checkout $VERSION
RUN git -C /ethminer submodule update --init --recursive
RUN mkdir -p /ethminer/build
WORKDIR /ethminer/build
RUN cmake .. -DETHASHCUDA=OFF
RUN cmake --build .
RUN make install

FROM frolvlad/alpine-glibc
COPY --from=build /usr/local/bin/kernels/ /usr/bin/kernels/
COPY --from=build /usr/local/bin/ethminer /usr/bin/ethminer
WORKDIR /
COPY start_miner.sh /start_miner.sh
ENV LC_ALL=C
ENV LD_LIBRARY_PATH=/usr/externalibs
CMD ./start_miner.sh