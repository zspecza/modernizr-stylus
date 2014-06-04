var pkg = require('./package.json');

exports = module.exports = function(opts) {

  var implicit = (opts && opts.implicit == false) ? false : true;

  return function(style) {

    // utility function to be used in stylus
    // for converting comma-separated string
    // to an array/list
    style.define('each-target-of', function(value) {
      return value.val.split(',');
    });

    // include modernizr-stylus
    style.include(__dirname);

    // implicit import handling
    if (implicit) {
      style.import('modernizr-stylus');
    }

  };

};

exports.libname = pkg.name;
exports.path    = __dirname;
exports.version = pkg.version;
