const { execSync } = require("child_process");

execSync("make gcloud/build");
const result = execSync(
  "make gcloud/deploy 2>&1 | grep -oE --line-buffered 'https.+.run.app'"
).toString();
console.log({ result });
