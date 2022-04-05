FROM golang:1.18 AS build

WORKDIR /app

COPY go.mod main.go ./

COPY . .

RUN CGO_ENABLED=0 go build -o /app

FROM scratch

COPY --from=build /app /

ENTRYPOINT ["/codeeducation"]