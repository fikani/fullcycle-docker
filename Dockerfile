#build stage
FROM golang:alpine AS builder
COPY main.go /
RUN go build -o /main /main.go 

#final stage
FROM alpine
COPY --from=builder /main /
ENTRYPOINT ./main
