FROM mcr.microsoft.com/playwright:v1.30.0-focal

WORKDIR /app

COPY . .

RUN npm install

CMD [ "npm", "run", "test" ]

#how to run with specified browser from run command - 
# 1. ENTRYPOINT ["npx", "playwright", "test"] 
# 2. docker build . -t playwright
# 3. docker run --rm playwright --project=chromium   

#generate reports in Volume map in container and mapping local to view at the host
#allure and playwright report
# 1. docker build . -t playwright
# 2. docker run --rm --name playwright-container \ 
# -v "$PWD/Volume:/app/Volume" \
# playwright
# 3. playwright config reporter settings:
# reporter: [
#     ['list'],
#     ['html', { open: 'never', outputFolder: 'Volume/playwright-reporter' }],
#     ['allure-playwright', { outputFolder: 'Volume/allure-results' }],
#   ],