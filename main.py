#!/usr/bin/python
# coding: utf-8
from waitress import serve
from pyramid.config import Configurator
from pyramid.response import Response
from pyramid.view import view_config

from mako.template import Template
from mako.lookup import TemplateLookup

import commands

@view_config(route_name='index')
def index(request):
    mak_lookup = TemplateLookup(directories=["templates/"])
    template = mak_lookup.get_template('index.mak')
    return Response(template.render_unicode())

@view_config(route_name='execute')
def execute(request):
    mak_lookup = TemplateLookup(directories=["templates/"])
    template = mak_lookup.get_template('execute.mak')
    command = get_request_value(request, 'command')
    command_result = run(command)
    result = template.render_unicode(
            command_str=command,
            command_result=command_result
        )
    return Response(result)

def get_request_value(request, param, default=None, encode='utf-8'):
    try:
        var = request.params[param]
    except KeyError:
        var = default
    return unicode(var).encode('utf-8')

def run(command):
    if command=="":
        command = "pwd && ls -F"
    print command
    return commands.getoutput(command)

if __name__ == '__main__':
    config = Configurator()
    config.add_route('index', '/')
    config.add_route('execute', '/execute')
    config.add_static_view(name='static', path='static')
    config.scan()
    app = config.make_wsgi_app()
    serve(app, host='0.0.0.0')
