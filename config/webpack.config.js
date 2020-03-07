var webpack = require('webpack');
var path = require('path');
var fs = require('fs');

var nodeModules = {};
fs.readdirSync('node_modules')
  .filter(function(x) {
    return ['.bin'].indexOf(x) === -1;
  })
  .forEach(function(mod) {
    nodeModules[mod] = 'commonjs ' + mod;
  });

module.exports = {
  entry: './src/main.js',
  output: {
    path: path.join(__dirname, 'build'),
    filename: 'backend.js'
  },
  externals: nodeModules
  // 以下を追加した状態でも試してもエラーが発生
  // resolve: {
  //   modules: ['node_modules']
  // }
}