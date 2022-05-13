# pull official base image
FROM node:16-alpine
RUN apk add --no-cache --virtual .gyp python2 make g++

ENV NODE_ENV=development

WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./

RUN npm install

# add app
COPY . ./

EXPOSE 3000

# start app
CMD ["npm", "run", "start"]