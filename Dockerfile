# 使用官方的 Nginx 镜像作为基础镜像
FROM nginx:alpine

# 安装 OpenSSL（为了支持 HTTPS 和 HTTP/2）
RUN apk update && apk add --no-cache openssl

# 复制自定义的 nginx 配置文件到容器
COPY nginx.conf /etc/nginx/nginx.conf

# 复制 SSL 证书（如果你打算使用 HTTPS）
COPY certs /etc/ssl/certs

# Expose 80 和 443 端口
EXPOSE 80 443

# 启动 Nginx
CMD ["nginx", "-g", "daemon off;"]

