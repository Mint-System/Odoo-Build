import { defaultTheme } from 'vuepress'
import { searchPlugin } from '@vuepress/plugin-search'
import { plausiblePlugin } from './plausible'
import { defineUserConfig } from 'vuepress'
import sidebar from './sidebar'


export default defineUserConfig({
    lang: 'en-US',
    title: 'Odoo Build',
    description: 'The Mint System Odoo development environment.',
    head: [
        ['link', { rel: 'icon', href: '/icon.png' }]
    ],
    pagePatterns: ['**/*.md', '!.vuepress', '!node_modules', '!addons', '!odoo', '!enterprise', '!tmp', '!oca'],
    theme: defaultTheme({
        logo: '/icon.png',
        repo: 'mint-system/odoo-build',
        docsBranch: '16.0',
        editLink: true,
        navbar: [
            { text: 'Home', link: '/' },
            { text: 'Help', link: '/task' },
            { text: 'Snippets', link: '/snippets' },
            { text: 'Apps', link: 'https://apps.odoo.com/apps/modules/browse?author=Mint%20System%20GmbH' },
            { text: 'Mint System', link: 'https://www.mint-system.ch/odoo' }
        ],
        sidebar: {
            '/': [
                {
                    text: 'Home',
                    collapsible: false,
                    children: [
                        '/README.md',
                        '/task.md',
                        '/snippets.md',
                        '/revisions.md',
                    ],
                },
            ],
            '/snippets': [
                {
                    text: 'Snippets',
                    collapsable: false,
                    children: sidebar,
                },
            ]
        }
    }),
    plugins: [
        searchPlugin({
            maxSuggestions: 10
        }),
        plausiblePlugin({
            'domain': 'odoo.build'
        }),
    ],
})