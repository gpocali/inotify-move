FROM alpine:latest
MAINTAINER Gregory Pocali <1571781+gpocali@users.noreply.github.com>

ENV TERM=xterm-256color

RUN sed -i -e "s/#//" /etc/apk/repositories && \
	apk update && \
	apk add --no-cache inotify-tools
	
VOLUME ["/input", "/output"]

COPY ./inotify-move /bin/inotify-move
RUN chmod +x /bin/inotify-move

CMD ["inotify-move"]
