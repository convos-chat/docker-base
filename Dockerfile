FROM alpine:3.21
LABEL maintainer="contact@convos.chat"

ADD https://cpanmin.us/ /bin/cpanm
RUN chmod 0755 /bin/cpanm

ENV CRYPT_ARGON2_ARCH=NONE

RUN apk add --no-cache curl openssl perl perl-io-socket-ssl perl-net-ssleay wget && \
  apk add --no-cache --virtual builddeps build-base perl-dev && \
  /bin/cpanm -n -M https://cpan.metacpan.org \
  Future::AsyncAwait        \
  Cpanel::JSON::XS          \
  Crypt::Eksblowfish        \
  Crypt::Passphrase         \
  Crypt::Passphrase::Argon2 \
  Crypt::Passphrase::Bcrypt \
  DBD::SQLite               \
  EV                        \
  File::HomeDir             \
  File::ReadBackwards       \
  File::chdir               \
  HTTP::AcceptLanguage      \
  Hailo                     \
  IO::Socket::Socks         \
  IRC::Utils                \
  Math::Calc::Parser        \
  Module::Install           \
  Net::LDAP                 \
  Parse::IRC                \
  Syntax::Keyword::Try      \
  Text::Markdown            \
  Text::Markdown::Hoedown   \
  Time::Piece               \
  Unicode::UTF8             \
  YAML::XS          && \
  apk del builddeps && \
  rm -rf /root/.cpanm /var/cache/apk/*

CMD ["sh"]
