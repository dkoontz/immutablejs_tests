// setup code for MyModule
// Elm.Native.MyModule should be an object with
// a property `make` which is specified above
Elm.Native = Elm.Native || {};
Elm.Native.TestModule = Elm.Native.TestModule || {};
Elm.Native.TestModule.make = function make(elm) {
    var getRandom = function() {
      return Math.random()
    };

    // `values` is where the object returned by make ends up internally
    // return if it's already set, since you only want one definition of
    // values for speed reasons
    if (elm.Native.TestModule.values) return elm.Native.TestModule.values;

    // return the object of your module's stuff!
    return {
      getRandom: getRandom
    };
};
