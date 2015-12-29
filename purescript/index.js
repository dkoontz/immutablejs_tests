"use strict";

const Rewire = require('rewire');
// var Main = Rewire('./output.js').__get__("PS").Main;
// var Main = Rewire('./output/Main').__get__("PS").Main;
var Main = require('Main');
var List = require('Immutable.List');
var Record = require('Immutable.Record');
var Immutable = require('Immutable');
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

// var nums = [1,2,3,4,5,6,7];
// var list = List.makeList(nums);
// var list2 = List.push(list)(99);
// console.log(list2);

// var r = Record.makeRecord()
// console.log(Main.rec);

// console.log(Main.a1.transfers);
// Main.main();

// console.log(Main.nums);

var store = Main.createStore;
var store2 = Main.loadUnstagedFiles(["foo.txt", "bar.js", "baz.css", "quux.html"])(store);
var store3 = Main.summaryChanged("new summary")(store2);
var store4 = Main.messageChanged("new message")(store3);
var store5 = Main.setAmendCommit(true)(store4);
var store6 = Main.fileStaged("bar.js")(store5);

console.log("-------------");
console.log(store);
console.log("-------------");
console.log(store2);
console.log("-------------");
console.log(store3);
console.log("-------------");
console.log(store4);
console.log("-------------");
console.log(store5);
console.log("-------------");
console.log(store6);


// var commitMessageStore = Main.get();
//
// Main.summaryChanged("New summary");
// Main.messageChanged("New message");
// Main.setAmendCommit(true);
// Main.fileStaged("bar.js");
// var commitMessageStore2 = Main.get();
//
// compareStores(commitMessageStore, commitMessageStore2);
//
// console.log("commitMessageStore ========")
// console.log(commitMessageStore);
// console.log("commitMessageStore2 =======")
// console.log(commitMessageStore2);
//
// function compareStores(store1, store2)
// {
//   console.log("unsagedFiles: " + (store1.get('unstagedFiles') === store2.get('unstagedFiles') ? "same" : "changed"));
//   console.log("pendingCommit: " + (store1.get('pendingCommit') === store2.get('pendingCommit') ? "same" : "changed"));
//   console.log("  summary: " + (store1.get('pendingCommit').get('summary') === store2.get('pendingCommit').get('summary') ? "same" : "changed"));
//   console.log("  message: " + (store1.get('pendingCommit').get('message') === store2.get('pendingCommit').get('message') ? "same" : "changed"));
//   console.log("  amendPreviousCommit: " + (store1.get('pendingCommit').get('amendPreviousCommit') === store2.get('pendingCommit').get('amendPreviousCommit') ? "same" : "changed"));
//   console.log("  stagedFiles: " + (store1.get('pendingCommit').get('stagedFiles') === store2.get('pendingCommit').get('stagedFiles') ? "same" : "changed"));
// }
