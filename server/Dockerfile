FROM rust:1.83 AS builder

WORKDIR /app

# Compile Dependencies
COPY Cargo.* ./
RUN mkdir src && echo 'fn main() { panic!("Dummy Image Called!") }' > ./src/main.rs
RUN cargo build --release

# Add Source
COPY src ./src

# Break cargo cache
RUN touch ./src/main.rs

# Compile
RUN cargo build --release

FROM debian:bookworm AS runtime

COPY --from=builder /app/target/release/server /server

EXPOSE 3000
ENTRYPOINT ["/server"]
