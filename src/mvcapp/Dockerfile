FROM aspnet

ADD src /app/
WORKDIR /app

RUN kpm restore
EXPOSE 5004

ENTRYPOINT ["k", "--watch", "kestrel"]