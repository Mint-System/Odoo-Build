import { viteBundler } from '@vuepress/bundler-vite'
import { defaultTheme } from '@vuepress/theme-default'
import { slimsearchPlugin } from '@vuepress/plugin-slimsearch'
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
    pagePatterns: [
      '**/*.md',
      '!**/node_modules/**',
      '!**/.vuepress/**',
      '!**/venv*/**',
      '!**/addons/**',
      '!**/enterprise/**',
      '!**/tmp/**',
      '!**/oca/**',
      '!**/thirdparty/**',
      '!**/pycache/**',
    ],
    theme: defaultTheme({
        logo: '/icon.png',
        repo: 'mint-system/odoo-build',
        docsBranch: 'main',
        editLink: true,
        navbar: [
            { text: 'Home', link: '/' },
            { text: 'Help', link: '/task' },
            { text: 'Images', link: '/images/' },
            { text: 'Snippets', link: '/snippets' },
            { text: 'Revisions', link: '/revisions' },
            { text: 'Modules', link: '/modules' },
            { text: 'Changelog', link: '/CHANGELOG' },
            { text: 'Mint System', link: 'https://www.mint-system.ch/odoo' },
            { text: 'Chat', link: 'https://matrix.to/#/!gmucNdFKeaGvdzcGTP:mint-system.ch?via=mint-system.ch'}
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
                            text: 'Images',
                            link: '/images/',
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
        slimsearchPlugin({
            indexContent: true,
            suggestion: false
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
