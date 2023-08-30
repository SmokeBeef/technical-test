const app = require("./app/app");
const logger = require("./utils/logger");

const port = process.env.PORT || 8000

app.listen(port, () => {
    logger.info("app running in port " + port);
})