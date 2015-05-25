var path = require("path");


module.exports = {

  entry: "./scripts/index.cjsx",
  output: {
    path: path.join(__dirname, 'assets'),
    publicPath: "/assets/",
    filename: "bundle.js"
  },

	module: {
		loaders: [
      { test: /\.coffee$/, loader: "coffee" },
			{ test: /\.cjsx$/, loader: "coffee-jsx-loader" }
		]
	},

	resolve: {
		extensions: ["", ".web.coffee", ".web.js", ".coffee", ".js", ".cjsx"]
	}
}
