FROM node:12

# nice clean home for our action files
RUN mkdir /action
WORKDIR /action


# install node deps(for semantic versioning)
COPY ./package.json ./
RUN npm install
RUN npm ci 

# copy in entrypoint after dependency installation
COPY entrypoint.js .

ENTRYPOINT ["node", "/action/entrypoint.js"]
