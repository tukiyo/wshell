#!/usr/bin/python
# coding: utf-8
from waitress import serve
from pyramid.config import Configurator
from pyramid.response import Response
from pyramid.view import view_config

from mako.template import Template

import commands

@view_config(route_name='home')
def home(request):
    src = "<a href='/execute?command=ls'>execute page</a>"
    return Response(src)

@view_config(route_name='execute')
def execute(request):
    import os
    current_dir = os.getcwd()
    command = request.params['command']
    template = Template(filename=current_dir+'/templates/execute.mak', input_encoding="utf-8")
    result = template.render_unicode(result=exe(command))
    return Response(result)

def exe(command):
    if command=="":
        command = "ls"
    result = commands.getoutput(command)
    #import dbd; dbd.st_trace

    return form(command).encode('utf_8') + result + hilighter().encode('utf_8')

def form(command):
    src = "<html>"
    src+= "<head>"
    src+= "<meta charset='utf-8'>"
    src+= '<script type="text/javascript" src="static/scripts/shCore.js"></script>'
    src+= '<link type="text/css" rel="stylesheet" href="static/styles/shCore.css"/>'
    src+= '<link type="text/css" rel="stylesheet" href="static/styles/shThemeDefault.css"/>'
    src+= '<script type="text/javascript" src="static/scripts/shBrushBash.js"></script>'
    src+= "<style>*{font-size:small;}</style>"
    src+= "</head>"
    src+= "<body onload='document.forms[0].command.focus();'>"
    src+= "<form action='/execute' method='GET' onload='this.focus();'>"
    src+= "<input name='command' value='"+command+"'>"
    src+= "<input type='submit' value='execute'>"
    src+= "</form>"
    src+= '<pre class="brush: shell; ruler: true;">'
    return src

def hilighter():
    src = '</pre>'
    src+= '<script type="text/javascript">SyntaxHighlighter.all();</script>'
    return src

if __name__ == '__main__':
    config = Configurator()
    config.add_route('home', '/')
    config.add_route('execute', '/execute')
    config.add_static_view(name='static', path='static')
    config.scan()
    app = config.make_wsgi_app()
    serve(app, host='0.0.0.0')
