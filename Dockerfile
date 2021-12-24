FROM --platform=linux/amd64 rust:1 as builder-amd64

ENV RUST_TARGET=x86_64-unknown-linux-gnu

FROM --platform=linux/amd64 builder-amd64 as builder

WORKDIR .

COPY . .

RUN cargo build --release --target ${RUST_TARGET} --all-features

RUN cp /code/target/${RUST_TARGET}/release/oura /oura

FROM debian:buster-slim

#RUN apt-get update && apt-get install -y extra-runtime-dependencies && rm -rf /var/lib/apt/lists/*

COPY --from=builder /oura /usr/local/bin/oura

ENTRYPOINT [ "oura" ]
