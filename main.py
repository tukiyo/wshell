#!/usr/bin/env python
# coding: utf-8
from waitress import serve
from pyramid.config import Configurator
import views

if __name__ == '__main__':
    config = Configurator()
    config.add_route('index', '/')
    config.add_route('execute', '/execute')
    config.add_route('alc', '/alc')
    config.add_route('phpmanual', '/phpmanual')
    config.add_route('docs_python_jp', '/docs_python_jp')
    config.add_static_view(name='static', path='static')
    config.scan(".views")
    app = config.make_wsgi_app()
    serve(app, host='0.0.0.0', port='8080')
