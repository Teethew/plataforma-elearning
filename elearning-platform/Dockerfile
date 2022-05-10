FROM python:alpine3.10
WORKDIR /app

COPY /dist .
CMD [ "python", "-m", "http.server", "4200" ]
