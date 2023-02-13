# syntax=docker/dockerfile:1

FROM golang:1.16-alpine
# Create working directory under /app
WORKDIR /api
# Copy over all go config (go.mod, go.sum etc.)
COPY go.* ./
# Install any required modules
RUN go mod download
# Copy over Go source code
COPY *.go ./
# Run the Go build and output binary under hello_go_http
RUN go build -o /main
# Make sure to expose the port the HTTP server is using
EXPOSE 8080
# Run the app binary when we run the container
CMD [ "/main" ]