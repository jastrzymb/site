# Stage 1: Build
FROM ghcr.io/gleam-lang/gleam:v1.11.1-erlang-alpine

WORKDIR /app

# Copy project files
COPY . .

# Build the project and export erlang shipment
RUN gleam build

# Run the application
CMD ["gleam", "run"]
