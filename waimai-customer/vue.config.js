// vue.config.js
module.exports = {
    // 选项...
    publicPath:'./',
    devServer: {
        open: false, //是否自动弹出浏览器页面
        host: "localhost",
        port: '8000',
        https: false,   //是否使用https协议
        hotOnly: true, //是否开启热更新
        proxy: {
            '/waimai': {
                target: 'http://localhost:8099/',
                changeOrigin: true,
                pathRewrite: {
                    '^waimai/': ''
                }
            }
        }
    },
}