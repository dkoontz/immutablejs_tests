var rewire = require ('rewire');
var Elm = rewire ('../build/Main').__get__("Elm");
var runtime = Elm.worker(Elm.Main, {});

console.log(Elm);
