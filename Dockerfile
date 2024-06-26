FROM ubuntu:latest
ARG INSTALL_PYTHON_TK=true
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y 
RUN apt-get install git -y
RUN git clone https://github.com/chuyangliu/snake.git
WORKDIR /snake
RUN apt-get install python3-pip -y
RUN if [ "$INSTALL_PYTHON_TK" = "true" ]; then \
    echo "python3-tk python3-tk/tkinter_default_modselect select 8" | debconf-set-selections -v; \
    echo "python3-tk python3-tk/tkinter_default_qselect select 60" | debconf-set-selections -v; \
    apt-get install python3-tk -y; \
fi
RUN pip install numpy --break-system-packages
RUN pip install matplotlib --break-system-packages
RUN pip install pytest --break-system-packages

CMD ["python3", "run.py"]
