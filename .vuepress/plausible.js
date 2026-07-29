import { path } from '@vuepress/utils'

const name = '@mint-system/plugin-plausible'

const plausiblePlugin = ({ domain }) => {
    return {
        name,
        clientConfigFile: path.resolve(__dirname, 'plausibleClient.js'),
        define: {
            __PLAUSIBLE_OPTIONS__: { domain },
        },
    }
}

export { plausiblePlugin }