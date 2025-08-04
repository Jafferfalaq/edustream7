FROM python:3.10.8-slim-buster

# Fix Debian Buster repo issue
RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until && \
    apt update && apt install -y git

COPY requirements.txt /requirements.txt
RUN pip install --upgrade pip && pip install -r /requirements.txt

WORKDIR /app
COPY . /app

CMD ["python", "bot.py"]
