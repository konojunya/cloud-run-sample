FROM node:12.7.0-alpine

WORKDIR /web

# install dependency
RUN apk add --no-cache --virtual=build-dependencies python make g++ && \
  apk add --no-cache curl libc6-compat && \
  apk add --no-cache yarn

# copy sources
COPY . .

# fetch dependencies & make log dir
RUN yarn --pure-lockfile && \
  yarn cache clean && \
  apk del build-dependencies && \
  rm -rf /var/cache/apk/*

# environment
ENV PORT 3000

# run settings
EXPOSE 3000
ENTRYPOINT ["yarn"]
CMD ["start"]
