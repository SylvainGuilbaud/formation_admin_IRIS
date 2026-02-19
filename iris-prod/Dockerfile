ARG IMAGE=containers.intersystems.com/intersystems/iris:latest-cd
FROM $IMAGE

USER root

COPY cert /opt/cert

RUN chmod -R +rx /opt/cert

USER ${ISC_PACKAGE_MGRUSER}
WORKDIR /home/irisowner/dev

ENV PYTHON_PATH=/usr/irissys/bin/irispython
ENV SRC_PATH=/opt/irisapp
ENV IRISUSERNAME=SuperUser
ENV IRISPASSWORD=SYS
ENV IRISNAMESPACE=USER

COPY key/iris.key /usr/irissys/mgr/iris.key

RUN mkdir -p /home/irisowner/keys 

RUN --mount=type=bind,src=.,dst=. \
    iris start IRIS && \
    iris session IRIS < iris-sys.script && \
    iris merge IRIS merge.cpf && \
	iris session IRIS < iris-prod.script && \
    iris stop IRIS quietly