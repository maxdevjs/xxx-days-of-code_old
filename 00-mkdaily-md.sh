#!/usr/bin/env bash

YYMMDD=${1:-`date +%y%m%d`}

echo $YYMMDD

if [ -f dailies-md/$YYMMDD.md ];
then
    echo dailies-md/$YYMMDD.md exists
else
    # touch dailies-md/$YYMMDD.md
    sed "s/YYMMDD/$YYMMDD/" templates/template.md > dailies-md/$YYMMDD.md
fi
