var exec = require('cordova/exec');

exports.request = function (arg0, success, error) {
    exec(success, error, 'NetWork', 'request', [arg0]);
};
