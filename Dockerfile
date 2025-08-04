FROM python:3.10.8-slim-buster

# Dont Remove My Credit @AV_BOTz_UPDATE 
# This Repo Is By @BOT_OWNER26 
# For Any Kind Of Error Ask Us In Support Group @AV_SUPPORT_GROUP

# Update APT sources to use Debian archive (since Buster is EOL)
RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until && \
    apt update && apt upgrade -y && \
    apt install -y git

COPY requirements.txt /requirements.txt

# Upgrade pip and install dependencies
RUN pip3 install --upgrade pip && \
    pip3 install --upgrade -r /requirements.txt

# Setup working directory
RUN mkdir /AV_FILE_TO_LINK
WORKDIR /AV_FILE_TO_LINK

# Copy project files
COPY . /AV_FILE_TO_LINK

# Dont Remove My Credit @AV_BOTz_UPDATE 
# This Repo Is By @BOT_OWNER26 
# For Any Kind Of Error Ask Us In Support Group @AV_SUPPORT_GROUP

CMD ["python", "bot.py"]
