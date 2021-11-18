module.exports = {
    title: 'Odoo Development',
    description: 'The Mint System Odoo development environment.',
    head: [
        ['link', { rel: "icon", type: "image/png", href: "icon.png"}],
    ],
    themeConfig: {
        sidebar: 'auto',
        repo: 'mint-system/odoo-development',
        docsBranch: '14.0',
        editLinks: true,
        nav: [
            { text: 'Home', link: '/' },
            { text: 'Snippets', link: '/snippets' }
        ],
    },
    dest: 'public',
}
