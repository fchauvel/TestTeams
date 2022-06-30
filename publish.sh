#!/usr/bin/bash

set -e

PROJECT_HOME=$(pwd)

echo "Project: ${PROJECT_HOME}"

# Login to m365 using a PFX certificate
#npx m365 login \
#   --debug \
#   --authType certificate \
#   --certificateFile "${PFX_CERTIFICATE}" \
#   --password "${PWD_CERTIFICATE}" \
#   --appId "${APP_ID}" \
#   --tenant "${TENANT_ID}"

# Login with a PEM certificate
#npx m365 login \
#    --authType certificate \
#    --certificateFile "$(pwd)/teamstest.pem" \



# Using DeviceFlow
#npx m365 login \
#    --debug \
#    --appId "${APP_ID}"

# Using user credentials
npx m365 login \
    --authType password \
    --userName "${CI_USERNAME}" \
    --password "${CI_PASSWORD}"

echo "DBG: Logged in!"

app=$(npx m365 teams app list --debug --output json | jq --arg appId "${TEAMS_TEST_APP_ID}" '.[] | select(.externalId==$appId)')
if [ -z "${app}" ];
then
    echo "DBG: Publishing the application..."
    npx m365 teams app publish \
        --filePath "${PROJECT_HOME}/package/teamstest.zip"
else
    echo "DBG: Updating the application..."
    appId=$(echo $app | jq -r '.id')
    echo "App ID: ${appId}"
    npx m365 teams app update \
        --id "${appId}" \
        --filePath  "${PROJECT_HOME}/package/teamstest.zip"
fi
