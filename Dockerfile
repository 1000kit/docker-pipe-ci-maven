FROM maven:3.6.0-jdk-8 as build

RUN curl "https://get.helm.sh/helm-v2.14.3-linux-amd64.tar.gz" -o "helm.tar.gz" \
    && tar xzvf helm.tar.gz \
    && ls -all .

COPY .m2 /root/.m2

FROM maven:3.6.0-jdk-8

COPY --from=build linux-amd64 /usr/local/bin
COPY --from=build /root/.m2 /root/.m2