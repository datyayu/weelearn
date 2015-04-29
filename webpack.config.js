module.exports = {

  entry: "./main.coffee",
  output: {
    path: __dirname,
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
