FROM node:18

# Create app directory and give permissions to node user
WORKDIR /home/node/app
RUN chown node:node /home/node/app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY --chown=node:node ./package*.json ./

# In dev run the npm install
RUN npm install  

# If you are building your code for production
#RUN npm ci

# Bundle app source
COPY --chown=node:node . .

# change user to node
USER node

# APP is listening on port 8080
EXPOSE 8080

# Run start command
CMD [ "node", "server.js" ]
