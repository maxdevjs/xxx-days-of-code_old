#!/usr/bin/env bash

YYMMDD=${1:-`date +%y%m%d`}

mv dailies-md/$YYMMDD.html dailies/

if [ -f dailies-md/$YYMMDD.js ];
then
    mv dailies-md/$YYMMDD.js dailies/
fi

if [ -f dailies-md/$YYMMDD.png ];
then
    mv dailies-md/$YYMMDD.png thumbs/
fi
