FROM node:alpine
ENV CI true
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
ENTRYPOINT [ "sh", "bin/builder.sh" ]
CMD ["build"]
