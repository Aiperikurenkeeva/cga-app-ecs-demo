FROM node:10-alpine
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY package*.json ./
RUN npm config set registry http://registry.npmjs.org/ #npm is a tool helps to configure node.js 
RUN npm install 
COPY --chown=node:node . . # . means copying from current folder and . destination remote container /home/node.app
USER node #start my container with node user
EXPOSE 8080 #serve my js website on 8080 port
CMD [ "node", "index.js" ]  