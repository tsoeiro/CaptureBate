FROM alpine:edge
RUN apk --update --no-cache add python libxml2 libxslt \
 && apk --update --no-cache add --virtual build-dep git py-pip python-dev gcc musl-dev linux-headers libxml2-dev libxslt-dev \
 && git clone https://github.com/bzsklb/CaptureBate /root/capturebate \
 && cd /root/capturebate && pip install --no-cache-dir -r requirements.txt \
 && apk del build-dep --no-cache \
 && rm -Rf /tmp/*
CMD cd /root/capturebate && python main.py
