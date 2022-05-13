const path = require("path");
const webpack = require("webpack");
const merge = require("webpack-merge");

const webpackCommon = require("./webpack.common");

module.exports = merge.smart(webpackCommon, {
  mode: "development",
  output: {
    publicPath: "/", // deploy on server with /app/ folder name
    filename: "[name].bundle.js",
    path: path.resolve(__dirname, "../docs")
  },
  devServer: {
    hot: true,
    open: true,
    historyApiFallback: true,
    overlay: true,
    contentBase: path.join(__dirname, "docs"),
    host: "131.114.73.88",
    port: 80,
    publicPath: "/"
  },
  devtool: "cheap-eval-source-map",
  plugins: [new webpack.HotModuleReplacementPlugin()]
});
