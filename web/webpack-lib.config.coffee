path = require 'path'

module.exports =
  entry:
    legimens: './src/legimens.coffee'
  output:
    filename: 'legimens.js'
    path: path.resolve(__dirname, 'lib')
    library: 'legimens'
    libraryTarget: 'umd'
    publicPath: '/'
  module:
    rules: [
      {
        test: /\.coffee$/,
        use: [
          {
            loader: 'babel-loader'
            options:
              presets: ['@babel/env', '@babel/react']
          }
          'coffee-loader'
        ],
        exclude: /node_modules/
      },
      {
        test: /\.less$/,
        use: [{
          loader: 'style-loader' ,
        }, {
          loader: 'css-loader',
        }, {
          loader: 'less-loader',
        }],
      },
      {
        test: /\.css$/,
        use: ['style-loader', 'css-loader'],
      },

    ]
  externals:
    react:
      root: 'React'
      commonjs2: 'react'
      commonjs: 'react'
    'react-dom':
      root: 'ReactDom'
      commonjs: 'react-dom'
      commonjs2: 'react-dom'
