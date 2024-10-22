ARG IMAGE=containers.intersystems.com/intersystems/iris:2024.2
FROM $IMAGE

USER root

COPY cert /opt/cert


RUN add-apt-repository ppa:deadsnakes/ppa -y && \
    apt update && \
    apt-get install -y \
    python3.11 python3.11-venv python3.11-dev && \
    # sudo && \
	# /bin/echo -e ${ISC_PACKAGE_MGRUSER}\\tALL=\(ALL\)\\tNOPASSWD: ALL >> /etc/sudoers && \
	# sudo -u ${ISC_PACKAGE_MGRUSER} sudo echo enabled passwordless sudo-ing for ${ISC_PACKAGE_MGRUSER} && \
	chmod -R +rx /opt/cert

USER ${ISC_PACKAGE_MGRUSER}
WORKDIR /home/irisowner/dev

ARG TARGETARCH=${TARGETARCH}

ENV PYTHON_PATH=/usr/irissys/bin/irispython
ENV SRC_PATH=/opt/irisapp
ENV IRISUSERNAME=SuperUser
ENV IRISPASSWORD=SYS
ENV IRISNAMESPACE=USER
ENV JAVA_HOME /usr/lib/jvm/temurin-8-jdk-${TARGETARCH}
ENV PATH "/home/irisowner/iris_env/bin:/home/irisowner/.local/bin:/usr/irissys/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/irisowner/bin:${JAVA_HOME}/bin:${PATH}"

COPY key/iris.key /usr/irissys/mgr/iris.key

RUN --mount=type=bind,src=.,dst=. \
    mkdir -p /home/irisowner/keys && \
	python3.11 -m venv ~/iris_env && \
	. ~/iris_env/bin/activate && \
    pip3 install -r requirements.txt && \
    iris start IRIS && \
    iris session IRIS < iris-sys.script && \
    iris merge IRIS merge.cpf && \
	iris session IRIS < iris-prod.script && \
    iris stop IRIS quietly