#!/usr/bin/env bash

YYMMDD=${1:-`date +%y%m%d`}

echo $YYMMDD

if [ -f dailies-md/$YYMMDD.html ];
then
    echo dailies-md/$YYMMDD.html exists
else
    sed "s/YYMMDD/$YYMMDD/" templates/template.html > dailies-md/$YYMMDD.html

    # markdown to html
    node ./generateReadMe.js $YYMMDD

    # include $YYMMDD.html in template.html
    # sed -e '/HERE/ {' -e 'r '"$FILE" -e 'd' -e '}' -i test
    # sed -e '/HERE/ {' -e 'r '"dailies-md/$YYMMDD.md" -e 'd' -e '}' -i dailies-md/$YYMMDD.html
    sed -e '/HERE/ {' -e 'r dailies-md/temp.html' -e 'd' -e '}' -i dailies-md/$YYMMDD.html
    echo replaced daily content in dailies-md/$YYMMDD.html

    js-beautify dailies-md/$YYMMDD.html >> dailies-md/temp1.html
    echo beautified dailies-md/$YYMMDD.html

    mv dailies-md/temp1.html dailies-md/$YYMMDD.html
    echo copied to dailies-md/$YYMMDD.html

    rm dailies-md/temp.html
fi

# if [ -f dailies-md/$YYMMDD.js ];
# then
#     echo dailies-md/$YYMMDD.js exists
# else
#     cp templates/template.js dailies-md/$YYMMDD.js
# fi