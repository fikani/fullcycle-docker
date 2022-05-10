#build stage
FROM golang:alpine AS builder
COPY main.go /
RUN go build -ldflags "-w" -o /main /main.go 

#final stage
FROM scratch
COPY --from=builder /main /
ENTRYPOINT ["./main"]
