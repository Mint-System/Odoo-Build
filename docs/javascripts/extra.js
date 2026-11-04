// Plausible analytics
// Replicates the previous Vuepress plugin (@mint-system/plugin-plausible),
// which injected the Plausible script with data-domain = odoo.build.
;(function () {
  if (document.querySelector('script[data-domain="odoo.build"]')) {
    return
  }
  var script = document.createElement('script')
  script.defer = true
  script.dataset.domain = 'odoo.build'
  script.src = 'https://plausible.io/js/script.js'
  document.head.appendChild(script)
})()
