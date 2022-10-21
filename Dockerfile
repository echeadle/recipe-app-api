FROM python:3.9-alpine.3.13
LABEL maintainer="echeadle.info"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./ /app
WORKDIR /app
EXPOSE 8000

RUN python -m venv /py && \
    /py/bin/pip --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    rm -rf /tmp && \
    adduser \
        --disable-password \
        --no-create-home \
        django-user
    
ENV PATH="/py/bin:$PATH"

USER django-user