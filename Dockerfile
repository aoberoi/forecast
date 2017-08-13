# This is a little dangerous because the swift version is implied.
# I might want to create my own base image at some point
FROM killex/swift4:latest

LABEL maintainer="Ankur Oberoi <aoberoi@gmail.com>"

WORKDIR /project

COPY . /project
RUN swift build -c release

ENTRYPOINT [".build/release/forecast"]

CMD ["help"]
