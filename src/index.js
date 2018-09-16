'use strict';

// require index.html so it gets copied to dist
require('./index.html');

// use the webpack elm loader to load elm code directly
var elm = require('./Main.elm');
window.elm = elm;

elm.Elm.Main.init();

// mount elm app
// var app = elm.Elm.Main.embed(mountNode);
