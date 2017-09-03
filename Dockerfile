FROM arm32v6/alpine
RUN apk update --no-cache && \
    apk add --no-cache python3 && \
    adduser -D -u 1000 -g 'www' www && \
    mkdir /www && \
    chown -R www:www /www && \
    chmod 755 /www

COPY index.html /www
User www

EXPOSE 8080
WORKDIR /www
CMD ["python3", "-m", "http.server", "8080"]