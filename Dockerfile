# Get Golang 1.17
FROM golang:1.17-alpine

# Set working directru
WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download all dependancies.
RUN go mod download

# Copy the source from the current directory
# to the Working Directory inside the container
COPY . .

# Build the Go app with name 'profile'
# as the executable file
RUN go build -o profile ./cmd

# Expose 4000
EXPOSE 4000

# Run Application
CMD ["./profile"]