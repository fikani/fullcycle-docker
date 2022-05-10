#build stage
FROM golang:alpine AS builder
RUN apk add --no-cache git
WORKDIR /app
COPY main.go ./
RUN go build main.go

#final stage
FROM alpine:latest
COPY --from=builder /app /app
WORKDIR /app
ENTRYPOINT ./main
EXPOSE 3000
