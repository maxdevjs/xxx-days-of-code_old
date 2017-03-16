var marked = require('marked');
var fs = require('fs');

var readMe = fs.readFileSync('./dailies-md/' + process.argv[2] + '.md', 'utf-8');
var markdownReadMe = marked(readMe);

fs.writeFileSync('./dailies-md/temp.html', markdownReadMe);