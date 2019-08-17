// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

document.querySelector('svg text').addEventListener('click', (textElm) => {
  textElm.target.closest('svg').classList.add("ccw-rotate")
  setTimeout(() => {
    textElm.target.closest('svg').classList.remove("ccw-rotate")
  }, 5000);
})
