#!/bin/bash

DEV_PATH=$(PWD)

ONCHAIN_PATH="$DEV_PATH/../../onchain"
ONCHAIN_LOG_PATH="$DEV_PATH/onchain"

cd $ONCHAIN_PATH

kill $(cat $ONCHAIN_LOG_PATH/hardhat-node.pid)
rm $ONCHAIN_LOG_PATH/hardhat-node.pid

rm $ONCHAIN_LOG_PATH/node.log
rm $ONCHAIN_LOG_PATH/token.log
rm $ONCHAIN_LOG_PATH/course.log

cd $DEV_PATH
docker compose down