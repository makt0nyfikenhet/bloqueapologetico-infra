#!/bin/bash

DEV_PATH=$(PWD)

ONCHAIN_PATH="$DEV_PATH/../../onchain"
ONCHAIN_LOG_PATH="$DEV_PATH/onchain"

# cd "$DEV_PATH/api"
# make build

cd $ONCHAIN_PATH
npx hardhat node > $ONCHAIN_LOG_PATH/node.log 2>&1 & echo $! > $ONCHAIN_LOG_PATH/hardhat-node.pid
sleep 5
npx hardhat run scripts/deploy-mock-usdt.ts --network localhost > $ONCHAIN_LOG_PATH/token.log
npx hardhat run scripts/deploy.ts --network localhost > $ONCHAIN_LOG_PATH/course.log

cd $DEV_PATH
docker compose up db redis