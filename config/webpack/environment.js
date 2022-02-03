const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.plugins.prepend('Provide',
			    new webpack.ProvidePlugin({
				$: 'jquery',
				jQuery: 'jquery'
			    })
			   );


const aliasConfig = { 'jquery': 'jquery/src/jquery' };
environment.config.set('resolve.alias', aliasConfig);

module.exports = environment
