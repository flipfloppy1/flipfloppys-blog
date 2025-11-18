FROM golang AS build
WORKDIR /app
COPY . .
RUN go install github.com/gohugoio/hugo@latest && hugo build

FROM nginx
COPY --from=build /app/public /usr/share/nginx/html
