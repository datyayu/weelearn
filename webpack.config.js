var path = require("path");


module.exports = {

  entry: "./scripts/main.coffee",
  output: {
    path: path.join(__dirname, 'assets'),
    publicPath: "/assets/",
    filename: "bundle.js"
  },

	module: {
		loaders: [
			{ test: /\.coffee$/, loader: "coffee" }
		]
	},

	resolve: {
		extensions: ["", ".web.coffee", ".web.js", ".coffee", ".js"]
	}
}
