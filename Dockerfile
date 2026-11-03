FROM python:3.11-slim
ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY app.py .
EXPOSE 5000
CMD ["python", "app.py"]

# Fitur Pengembangan: Docker Native Healthcheck menggunakan library bawaan Python
HEALTHCHECK --interval=10s --timeout=3s --start-period=3s --retries=3 \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:5000/health')" || exit 1
