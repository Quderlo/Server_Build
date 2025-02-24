FROM nginx:latest as production

WORKDIR /app

COPY --from=builder /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]