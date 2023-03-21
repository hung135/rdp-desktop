FROM lscr.io/linuxserver/rdesktop:latest
#USER root
RUN apk update
RUN apk add vim wget unzip openjdk11 
# Download and install NetBeans 17
RUN wget https://dlcdn.apache.org/netbeans/netbeans/17/netbeans-17-bin.zip -P /tmp && \
    unzip /tmp/netbeans-17-bin.zip -d /opt && \
    rm /tmp/netbeans-17-bin.zip

# Add NetBeans to PATH
ENV PATH $PATH:/opt/netbeans-17/bin
# Create NetBeans desktop launcher
# Copy NetBeans desktop launcher
COPY netbeans.desktop /usr/share/applications/netbeans.desktop
