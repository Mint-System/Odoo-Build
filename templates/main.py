from werkzeug.exceptions import NotFound

from odoo import http
from odoo.http import request
from odoo.tools import html2plaintext

from odoo.addons.website_blog.controllers.main import WebsiteBlog


class WebsiteBlog(http.Controller):

    @http.route(['''/blog/<model("blog.blog"):blog>/feed'''], type='http', auth="public", website=True, sitemap=True)
    def blog_feed(self, blog, limit='15', **kwargs):
        v = {}
        v['blog'] = blog
        v['base_url'] = blog.get_base_url()
        v['posts'] = request.env['blog.post'].search([('blog_id', '=', blog.id)], limit=min(int(limit), 50), order="post_date DESC")
        v['html2plaintext'] = html2plaintext
        r = request.render("website_blog.blog_feed", v, headers=[('Content-Type', 'application/atom+xml')])
        return r