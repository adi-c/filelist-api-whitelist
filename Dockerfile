FROM python:3.12.1-slim-bookworm

RUN apt-get -y update
RUN apt-get install -y chromium chromium-driver

RUN pip install --upgrade pip
RUN pip install schedule
RUN pip install selenium==4.0.0

COPY ./src .

CMD ["python","-u","app.py"]