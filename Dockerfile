FROM node:10

COPY . .

#Installing all the dependencies needed by Playwright
RUN apt-get update &&\
    apt-get -y install libnss3 &&\
    apt-get -y install libasound2 &&\
    apt-get -y install libatspi2.0-0 &&\
    apt-get -y install libdrm2 &&\
    apt-get -y install libgbm1 && \
    apt-get -y install libgtk-3-0 && \
    apt-get -y install libxkbcommon-x11-0

RUN apt-get -y install libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb

RUN apt-get install -y wget &&\
    apt-get install -y libxss1 libappindicator1 libindicator7 &&\
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&\ 
    apt -y install ./google-chrome*.deb
# Move to the directory and install all the dependencies listed in Package.jsonave

RUN npm run test

# FROM cypress/base:8.0.0
# # FROM cypress/base:12.4.0
# # FROM cypress/browsers:node12.6.0-chrome77
# #
# # FROM cypress/base:ubuntu19-node12.14.1

# RUN echo "current user: $(whoami)"
# RUN echo "current node: $(node -v)"
# RUN echo "current npm:  $(npm -v)"

# # avoid too many progress messages
# # https://github.com/cypress-io/cypress/issues/1243
# ENV CI=1
# # create package.json file
# # RUN npm init --yes

# # # install either a specific version of Cypress
# # ENV CYPRESS_INSTALL_BINARY=https://cdn.cypress.io/beta/binary/4.0.3/darwin-x64/circle-develop-cb0f32b0b4913cbb403f2e7c51b23ecad50ece9f-266831/cypress.zip
# # # RUN npm install --save-dev cypress@4.0.2
# # RUN npm install https://cdn.cypress.io/beta/npm/4.0.3/circle-develop-cb0f32b0b4913cbb403f2e7c51b23ecad50ece9f-266811/cypress.tgz
# # # or install a beta version of Cypress using environment variables
# # # ENV CYPRESS_INSTALL_BINARY=https://cdn.cypress.io/beta/binary/3.3.0/linux64/circle-develop-40502cbfb7b934afce0a7b1dba4141dab4adb202-100529/cypress.zip
# # # RUN npm install https://cdn.cypress.io/beta/npm/3.3.0/circle-develop-40502cbfb7b934afce0a7b1dba4141dab4adb202-100527/cypress.tgz

# # show where Cypress binary was installed
# # hmm, why silent exit?!
# RUN $(npm bin)/cypress cache path

# RUN ELECTRON_ENABLE_STACK_DUMPING=1 $(npm bin)/cypress verify
# # initialize a basic project with Cypress tests
# # RUN npx @bahmutov/cly init
# # if testing a base image with just Electron use "cypress run"
# RUN $(npm bin)/cypress run --browser chrome
# # # # if testing an image with Chrome browser
# # # RUN $(npm bin)/cypress run --browser chrome

