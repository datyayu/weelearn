path = require "path"

module.exports =
  entry: "./scripts/index.cjsx"

  output:
    path: path.join __dirname, 'assets'
    publicPath: "/assets/js/"
    filename: "bundle.js"

  devtool: "#source-map"

  module:
    loaders: [
      { test: /\.coffee$/, loader: "coffee" }
      { test: /\.cjsx$/, loader: "coffee-jsx-loader" }
    ]

    # noParse: /node_modules\/*/

  resolve:
    extensions: [
      ""
      ".web.coffee"
      ".web.js"
      ".coffee"
      ".js"
      ".cjsx"
    ]

