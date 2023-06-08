FROM node:10.16.3 AS development

RUN mkdir /srv/search && chown node:node /srv/search

USER node

WORKDIR /srv/search

COPY --chown=node:node package.json package-lock.json ./

RUN npm install

RUN npm install -save ejs

FROM node:10.16.3-slim AS production

USER node

WORKDIR /srv/search

COPY --from=development --chown=root:root /srv/search/node_modules ./node_modules

COPY . .

CMD ["node", "index.js"]
