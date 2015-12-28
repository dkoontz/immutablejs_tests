const Rewire = require('rewire');
var Main = Rewire('./output.js').__get__("PS").Main;

// var nums = [1,2,3,4]
// var baz = Main.makeBaz(nums)(99);
// var bar = Main.makeBar("bar string")(baz);
//
// // var baz2 = Main.updateBazCount(baz)(71);
// var baz2 = Main.appendBazNums(baz)(9);
//
// // console.log(baz);
//
// // fooA.foo1 = "updated by JS";
// nums.push(5);
//
// console.log("bazNums " + (baz.bazNums === baz2.bazNums ? "same" : "different"));
// console.log("bazCount " + (baz.bazCount === baz2.bazCount ? "same" : "different"));
//
// console.log(baz.bazNums);
// console.log(baz2.bazNums);

var nums = [1,2,3];
var list = Main.makeList(nums);
console.log(nums.length);
