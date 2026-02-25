ARG IMAGE=intersystemsdc/irishealth-community:latest
ARG IMAGE=intersystemsdc/iris-community:latest
FROM $IMAGE 

WORKDIR /home/irisowner/dev

ENV IRISUSERNAME=SuperUser
ENV IRISPASSWORD=SYS
ENV IRISNAMESPACE=IRISAPP
ENV PYTHON_PATH=/usr/irissys/bin/

RUN --mount=type=bind,src=.,dst=. \
	iris start IRIS && \
	iris merge IRIS merge.cpf && \
	iris session IRIS < iris.script && \
	iris stop IRIS quietly
	