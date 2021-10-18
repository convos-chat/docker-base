FROM alpine:3.14
LABEL maintainer="contact@convos.chat"

RUN apk add --no-cache curl openssl perl perl-io-socket-ssl perl-net-ssleay wget && \
    apk add --no-cache --virtual builddeps build-base perl-dev

ADD https://cpanmin.us/ /bin/cpanm
RUN chmod 0755 /bin/cpanm

RUN mkdir /base
ADD https://raw.githubusercontent.com/convos-chat/convos/master/cpanfile /base/cpanfile
RUN cd /base && /bin/cpanm -n -M https://cpan.metacpan.org .

CMD ["sh"]
