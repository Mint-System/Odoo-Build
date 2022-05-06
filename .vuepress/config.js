module.exports = {
    title: 'Odoo Development',
    description: 'The Mint System Odoo development environment.',
    head: [
        ['link', { rel: "icon", type: "image/png", href: "icon.png"}],
    ],
    themeConfig: {
        logo: '/icon.png',
        sidebar: 'auto',
        repo: 'mint-system/odoo-development',
        docsBranch: '14.0',
        editLinks: true,
        nav: [
            { text: 'Home', link: '/' },
            { text: 'Help', link: '/task' },
            { text: 'Snippets', link: '/snippets' },
            { text: 'Mint System', link: 'https://www.mint-system.ch' }
        ],
    },
    dest: 'public',
}
