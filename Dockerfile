FROM python:3.10

WORKDIR /app
ARG DB_HOST
ARG DB_USER
ARG DB_PASS
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY . .
ENTRYPOINT ["python","src/main.py"]
