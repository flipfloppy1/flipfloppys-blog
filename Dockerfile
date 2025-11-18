FROM golang AS build
WORKDIR /app
COPY . .
RUN CGO_ENABLED=1 go install -tags extended github.com/gohugoio/hugo@latest && hugo build

FROM nginx
COPY --from=build /app/public /usr/share/nginx/html
