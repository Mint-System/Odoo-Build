const { defaultTheme } = require('vuepress')
const { searchPlugin } = require('@vuepress/plugin-search')

module.exports = {
    lang: 'en-US',
    title: 'Odoo Development',
    description: 'The Mint System Odoo development environment.',
    pagePatterns: ['**/*.md', '!.vuepress', '!node_modules', '!addons', '!odoo', '!enterprise','!tmp', '!oca'],
    theme: defaultTheme({
        logo: '/icon.png',
        repo: 'mint-system/odoo-development',
        docsBranch: '14.0',
        editLink: true,
        navbar: [
            { text: 'Home', link: '/' },
            { text: 'Help', link: '/task' },
            { text: 'Snippets', link: '/snippets' },
            { text: 'Mint System', link: 'https://www.mint-system.ch' }
        ],
    }),
    plugins: [
        searchPlugin(),
    ],
}