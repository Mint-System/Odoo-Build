import { viteBundler } from '@vuepress/bundler-vite'
import { defaultTheme } from '@vuepress/theme-default'
import { searchPlugin } from '@vuepress/plugin-search'
import { shikiPlugin } from '@vuepress/plugin-shiki'
import { plausiblePlugin } from './plausible'
import { defineUserConfig } from 'vuepress'
import sidebar from './sidebar'

export default defineUserConfig({
    bundler: viteBundler(),
    lang: 'en-US',
    title: 'Odoo Build',
    description: 'The Mint System Odoo development environment.',
    head: [
        ['link', { rel: 'icon', href: '/icon.png' }]
    ],
    pagePatterns: ['*.md', '!.vuepress', '!node_modules', '!addons', '!odoo', '!enterprise', '!tmp', '!oca', '!thirdparty', '!venv*'],
    theme: defaultTheme({
        logo: '/icon.png',
        repo: 'mint-system/odoo-build',
        docsBranch: '16.0',
        editLink: true,
        navbar: [
            { text: 'Home', link: '/' },
            { text: 'Help', link: '/task' },
            { text: 'Image', link: '/image/' },
            { text: 'Snippets', link: '/snippets' },
            { text: 'Revisions', link: '/revisions' },
            { text: 'Modules', link: '/modules' },
            { text: 'Changelog', link: '/CHANGELOG' },
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
                            text: 'Image',
                            link: '/image/',
                        },
                        {
                            text: 'Snippets',
                            link: '/snippets',
                        },
                        {
                            text: 'Revisions',
                            link: '/revisions',
                        },
                        {
                            text: 'Modules',
                            link: '/modules',
                        },
                        {
                            text: 'Changelog',
                            link: '/CHANGELOG',
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
        shikiPlugin({
            theme: 'catppuccin-latte',
            langs: ['bash', 'yml', 'yaml', 'json', 'css', 'html', 'xml', 'groovy', 'py', 'python', 'sql', 'powershell', 'txt', 'csv', 'mermaid', 'md', 'markdown', 'toml', 'php', 'dockerfile'],
        }),
    ],
})