FROM mono:3.10

ENV KRE_USER_HOME /opt/kre

RUN apt-get -qq update && apt-get -qqy install unzip

RUN curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/kvminstall.sh | sh
RUN bash -c "source $KRE_USER_HOME/kvm/kvm.sh \
	&& kvm install latest -a default \
	&& kvm alias default | xargs -i ln -s $KRE_USER_HOME/packages/{} $KRE_USER_HOME/packages/default"

# Install libuv for Kestrel from source code (binary is not in wheezy and one in jessie is still too old)
RUN apt-get -qqy install \
	autoconf \
	automake \
	build-essential \
	libtool
RUN LIBUV_VERSION=1.0.0-rc2 \
	&& curl -sSL https://github.com/joyent/libuv/archive/v${LIBUV_VERSION}.tar.gz | tar zxfv - -C /usr/local/src \
	&& cd /usr/local/src/libuv-$LIBUV_VERSION \
	&& sh autogen.sh && ./configure && make && make install \
	&& rm -rf /usr/local/src/libuv-$LIBUV_VERSION \
	&& ldconfig

ENV PATH $PATH:$KRE_USER_HOME/packages/default/bin

# copy the contents of the local directory to /app/ on the image
ADD helloworld /app/
# set the working directory for subsequent commands
WORKDIR /app
# fetch the NuGet dependencies for our application
RUN kpm restore
# set the working directory for subsequent commands
WORKDIR /app/src/hellomvc
# expose TCP port 5000 from container
EXPOSE 5000
# Configure the image as an executable
# When the image starts it will execute the “k web” command
# effectively starting our web application
# (listening on port 5000 by default)
ENTRYPOINT ["k", "web"]