FROM alpine:3.15.0 as alpine_builder

RUN apk add --no-cache openssl-dev git curl build-base rustup musl perl curl

WORKDIR /code/oura
RUN git config --global init.defaultBranch main &&  \
    git config --global advice.detachedHead false

RUN gitrev=v0.3.8 && \
    git init && \
    git remote add origin https://github.com/txpipe/oura.git && \
    git fetch --depth 1 origin tag "$gitrev" && \
    git checkout "$gitrev"

RUN rustup-init -y
RUN source $HOME/.cargo/env
RUN $HOME/.cargo/bin/cargo build --release --target x86_64-unknown-linux-musl --all-features

FROM alpine:3.15.0
RUN apk add --no-cache curl

COPY --from=alpine_builder /code/oura/target/x86_64-unknown-linux-musl/release/oura .

CMD "./oura"
