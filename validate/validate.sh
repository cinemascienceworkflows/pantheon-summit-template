#!/bin/bash

source ./pantheon/env.sh > /dev/null 2>&1

echo "----------------------------------------------------------------------"
echo "PTN: validating" 

OUTPUT=$PANTHEON_RUN_DIR/cinema_databases/$PANTHEON_CDB
GOLD=validate/data/pantheon.cdb

echo "     $OUTPUT"

dirs="0 1 2"
img="000.png"

PASS=true
if [ -d $OUTPUT ]; then
    for val in $dirs; do
        if cmp "$OUTPUT/$val/$img" "$GOLD/$val/$img"; then
            echo "     Comparing images $GOLD/$val/$img"
        else
            echo "FILES differ:"
            echo "    $OUTPUT"
            echo "    $GOLD"
            PASS=false
        fi
    done
else
    echo "Cinema Database: $OUTPUT does not exist"
    PASS=false
fi

if $PASS; then
    echo "PTN: PASS"
    echo "----------------------------------------------------------------------"
else
    echo "PTN: FAIL"
    echo "----------------------------------------------------------------------"
    exit 1
fi

