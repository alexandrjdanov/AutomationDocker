FROM mcr.microsoft.com/playwright:v1.30.0-focal

WORKDIR /app

COPY . .

RUN npm install

CMD [ "npm", "run", "test" ]