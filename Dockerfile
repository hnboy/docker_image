# 使用 Alpine 3.15 作为基础镜像
FROM python:3.9-alpine3.15

# 设置工作目录
WORKDIR /app

# 安装构建工具和系统依赖
RUN apk update && \
    apk add --no-cache gcc libc-dev libffi-dev && \
    pip install --upgrade pip

# 复制项目文件到容器
COPY . /app/

# 安装 FastAPI 和 Uvicorn
RUN pip install fastapi uvicorn

# 设置环境变量
ENV PYTHONUNBUFFERED=1

# 暴露应用的端口（FastAPI 默认是8000）
EXPOSE 8000

# 启动 FastAPI 应用
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

