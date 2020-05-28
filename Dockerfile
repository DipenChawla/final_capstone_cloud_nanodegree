FROM python:3.7

COPY ./requirements.txt requirements.txt
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt


COPY ./app /app

WORKDIR /app

ENV PYTHONUNBUFFERED 1

ARG APP_PORT=5000

EXPOSE $APP_PORT

CMD ["python", "app.py"]