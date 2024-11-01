ARG IMAGE=intersystemsdc/irishealth-community:latest
ARG IMAGE=intersystemsdc/iris-community:latest
FROM $IMAGE 

WORKDIR /irisdev/app

ENV IRISUSERNAME=SuperUser
ENV IRISPASSWORD=SYS
ENV IRISNAMESPACE=IRISAPP
ENV PYTHON_PATH=/usr/irissys/bin/
ENV LD_LIBRARY_PATH=${ISC_PACKAGE_INSTALLDIR}/bin:${LD_LIBRARY_PATH}
ENV PATH "/home/irisowner/.local/bin:/usr/irissys/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/irisowner/bin"

COPY . .

COPY iris.script /tmp/iris.script

RUN pip install -r requirements-dev.txt \
	&& iris start IRIS \
	&& iris session IRIS < /tmp/iris.script \
	&& iris stop IRIS quietly
	