# Docker container with playwright tests.

Tests will be runned inside container and test-report will be presented on the host in path ./playwright-report.

## Steps to create and run docker container with playwright tests

1. Create Dockerfile with the instructions - text file that contains all commands, in order, needed to build application image.
2. In your app root open terminal and execute command to build image with flag '-t' (name).

```bash
docker build . -t playwright
```

3. After building complete verify that image was created:

```
docker images
```

4. Run new Docker container using created image.
   In our case we would like to run tests inside created container. After tests-run is finished playwright will generate HTML-report, which cannot be opened inside container, because there is no any browser installed. So, we'll be able to open it on the host, using '-v' (volumes) in our command:

```
docker run -v "$PWD/playwright-report:/app/playwright-report" playwright
```

In case we want to run tests with flags, we can execute docker run command with '-it' and bash/sh:

```
docker run -it -v "$PWD/playwright-report:/app/playwright-report" playwright sh
```

Above command creates and starts a container from image with an shell as its main process. And we can run tests with conditions, for example:

```
npm run test -- --project=firefox
```

Generated report is saved at host in OurProjectName/playwright-report and can be opened in our case by executing:

```
npx playwright show-report
```
