FROM golang:1.20-alpine as builder

WORKDIR /build

COPY . .

RUN CGO_ENABLED=0 go build -o ./fullcyclerocks

FROM scratch

COPY --from=builder ./build/fullcyclerocks /

ENTRYPOINT [ "/fullcyclerocks" ]

