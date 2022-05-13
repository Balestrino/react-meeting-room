# pull official base image
FROM node:14-alpine
RUN apk add --no-cache --virtual .gyp python2 make g++

ENV NODE_ENV=development

WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./

RUN yarn

# add app
COPY . ./

# start app
CMD ["npm", "run", "start"]