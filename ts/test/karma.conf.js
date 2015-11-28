module.exports = function(config) {
  config.set({
    frameworks: ['jasmine'],
    files: [
      'unit/math.js',
    ],

    autoWatch: true,
    browsers: [ 'PhantomJS' ]
  });
};
