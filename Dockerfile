FROM buildo/scala-sbt-alpine:8_2.12.14_1.5.5

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
