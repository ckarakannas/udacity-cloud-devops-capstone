FROM python:3.8
ARG API_ENV=Development
ENV API_ENV=${API_ENV}
WORKDIR /usr/src/app
COPY requirements ./requirements
RUN pip install --no-cache-dir -r requirements/${API_ENV}.txt
COPY . .
EXPOSE 5000
