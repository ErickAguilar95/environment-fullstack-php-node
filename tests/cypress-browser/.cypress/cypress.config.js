const { defineConfig } = require('cypress');
const mochawesome = require('cypress-mochawesome-reporter/plugin');
const fs = require('fs');
const path = require('path');
const dotenv = require('dotenv');

const envPath = path.resolve('.env');
const envConfig = dotenv.parse(fs.readFileSync(envPath));


module.exports = defineConfig({
  e2e: {
    supportFile: true,
    supportFile: "/e2e/cypress/support/index.js",
    setupNodeEvents(on, config) {
      require('cypress-mochawesome-reporter/plugin')(on);
      on('task', {
        log(message) {
          console.log(message);
          return null;
        },
      });
    },
    fixturesFolder: false,
    screenshotsFolder: "/e2e/screenshots",
    videosFolder: "/e2e/videos",
    specPattern: [
      // "/e2e/cypress/integration/**/*.spec.js",
      "/e2e/cypress/integration/calendar_test.spec.js"
    ],
    env: {
      base_url: envConfig.BASE_URL || 'http://localhost:8080',
      cypress_base_url: envConfig.CYPRESS_BASE_URL || 'http://localhost:8080',
      cypress_browser: envConfig.CYPRESS_BROWSER || 'chrome',
    }
  },
  reporter: 'cypress-mochawesome-reporter',
  reporterOptions: {
    reportDir: 'cypress/results/report',
    overwrite: true,
    quiet: true,
    charts: true,
    cdn: true,
    reportTitle: 'Cypress Tests',
    embledScreenshots: true,
    inlineAssets: true,
  },
  screenshots: true,
  video: true
});