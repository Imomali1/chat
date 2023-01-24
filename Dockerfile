FROM golang:alpine AS builder

COPY . .
RUN go get -d -v

ENV GOOS=linux
ENV GOARCH=amd64
RUN go build -o bin

FROM alpine as runner

COPY --from=builder ./bin bin

EXPOSE 8080
CMD ["/bin"]