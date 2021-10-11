FROM rust:1.55-slim-buster AS builder
COPY . /app
WORKDIR /app
RUN cargo build --release
FROM scratch
COPY --from=builder /app/target/release/rust-gcp /rust-gcp
EXPOSE 8000
CMD ["/rust-gcp"]