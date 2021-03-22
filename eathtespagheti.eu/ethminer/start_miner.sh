#!/usr/bin/env sh

[ -z "$POOL" ] && export POOL="$SCHEME://$ETHWALLET.$WORKERNAME:@$POOLADDRESS:$POOLPORT"
[ -n "$API_PORT" ] && export API="--api-port $API_PORT"
[ -n "$RECHECK_TIME" ] && export RECHECK="--farm-recheck $RECHECK_TIME"

ethminer -G -P "$POOL" $API $RECHECK