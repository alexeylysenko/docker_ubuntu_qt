FROM ubuntu:18.04

RUN apt update 
RUN apt install -y unzip wget libfontconfig dbus libx11-6 libx11-xcb1 g++ make libglib2.0-0
RUN apt install --reinstall libssl-dev

ENV QT_VERSION_A=5.12
ENV QT_VERSION_B=5.12.4
RUN wget https://download.qt.io/archive/qt/${QT_VERSION_A}/${QT_VERSION_B}/qt-opensource-linux-x64-${QT_VERSION_B}.run
RUN chmod +x qt-opensource-linux-x64-${QT_VERSION_B}.run 
COPY qt-noninteractive.qs /qt-noninteractive.qs
RUN ./qt-opensource-linux-x64-${QT_VERSION_B}.run --script qt-noninteractive.qs  -platform minimal --verbose
ENV PATH="/qt/${QT_VERSION_B}/gcc_64/bin:${PATH}"
