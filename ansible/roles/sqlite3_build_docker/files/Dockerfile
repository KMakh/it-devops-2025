FROM gcc:12.5.0-bookworm

RUN apt-get update && apt-get install -y cmake

WORKDIR /sqlite3

COPY sqlite-amalgamation-3260000 sqlite-amalgamation-3260000
COPY CMakeLists.txt .
COPY build.sh .
RUN chmod +x build.sh

WORKDIR /sqlite3/build

CMD ["../build.sh"]
