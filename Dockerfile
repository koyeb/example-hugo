FROM golang AS builder

ENV CGO_ENABLED=1
RUN go install -tags extended github.com/gohugoio/hugo@latest

WORKDIR /var/www
COPY myblog/ /var/www

RUN hugo


FROM nginx

COPY --from=builder /var/www/public/ /usr/share/nginx/html