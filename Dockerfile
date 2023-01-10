FROM golang:alpine3.17 as builder

WORKDIR /app
COPY . .
RUN go build ./main.go

FROM scratch

WORKDIR /app
COPY --from=builder /app/main .
ENTRYPOINT ["/app/main"]
