FROM golang:1.22.2-alpine3.19 AS build-env

RUN apk --update add \
		git \
		make \
		curl

WORKDIR /api
ADD . .

RUN go build -C ./app -o ./../../bin/api

FROM alpine

COPY --from=build-env /bin/api /api

EXPOSE 8080
ENTRYPOINT ["/api"]
