import { defaultTheme } from '@vuepress/theme-default'
import { searchPlugin } from '@vuepress/plugin-search'
import { plausiblePlugin } from './plausible'
import { defineUserConfig } from 'vuepress'
import sidebar from './sidebar'
import { viteBundler } from '@vuepress/bundler-vite'

export default defineUserConfig({
    bundler: viteBundler(),
    lang: 'en-US',
    title: 'Odoo Build',
    description: 'The Mint System Odoo development environment.',
    head: [
        ['link', { rel: 'icon', href: '/icon.png' }]
    ],
    pagePatterns: ['**/*.md', '!.vuepress', '!node_modules', '!addons', '!odoo', '!enterprise', '!tmp', '!oca', '!thirdparty'],
    theme: defaultTheme({
        logo: '/icon.png',
        repo: 'mint-system/odoo-build',
        docsBranch: '16.0',
        editLink: true,
        navbar: [
            { text: 'Home', link: '/' },
            { text: 'Help', link: '/task' },
            { text: 'Snippets', link: '/snippets' },
            { text: 'Revisions', link: '/revisions' },
            { text: 'Apps', link: 'https://apps.odoo.com/apps/modules/browse?author=Mint%20System%20GmbH' },
            { text: 'Mint System', link: 'https://www.mint-system.ch/odoo' }
        ],
        sidebar: {
            '/': [
                {
                    text: 'Home',
                    collapsible: false,
                    children: [
                        {
                            text: 'Home',
                            link: '/',
                        },
                        {
                            text: 'Help',
                            link: '/task',
                        },
                        {
                            text: 'Snippets',
                            link: '/snippets',
                        },
                        {
                            text: 'Revisions',
                            link: '/revisions',
                        }
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