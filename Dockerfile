FROM mcr.microsoft.com/playwright:v1.31.0-focal

WORKDIR /app

COPY . .

RUN npm install

RUN npx playwright install

CMD [ "npm", "run", "test" ]