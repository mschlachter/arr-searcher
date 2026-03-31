FROM alpine:latest

WORKDIR /app
RUN apk --update add jq curl
COPY scripts/ .

RUN adduser -S api_user
USER api_user

CMD ["sh", "-c", "/app/run.sh"]
