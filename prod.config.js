const path = require('path');

module.exports = {
  mode: 'production', // Sets the mode to production
  entry: './app/javascript/application.js', // Your entry point (replace with your actual entry point if different)
  output: {
    filename: 'bundle.js', // Output filename
    path: path.resolve(__dirname, 'dist'), // Output directory
  },
  // Add other production-specific configurations here (e.g., minification, plugins)
};
