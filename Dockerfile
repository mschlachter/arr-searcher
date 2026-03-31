FROM alpine:latest

WORKDIR /app
RUN apk --update add jq curl
COPY scripts/ .

CMD ["sh", "-c", "/app/run.sh"]
