from pyramid.response import Response
from pyramid.view import view_config

from mako.template import Template
from mako.lookup import TemplateLookup

import urllib

from utils import get_request_value, run, is_allowed_ip, get_now


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
    if is_allowed_ip(request.remote_addr) == False:
        command = "echo 'not allowed at your IP address(%s).'" % request.remote_addr
    now=get_now()
    print now,
    command_result = run(command)
    result = template.render_unicode(
            now=now,
            command_result=command_result
        )
    return Response(result)

@view_config(route_name='alc')
def alc(request):
    mak_lookup = TemplateLookup(directories=["templates/"])
    template = mak_lookup.get_template('alc.mak')
    word = get_request_value(request, 'word')
    now=get_now()
    result = template.render_unicode(
            now=now,
            word=urllib.quote(word)
        )
    return Response(result)

@view_config(route_name='phpmanual')
def phpmanual(request):
    mak_lookup = TemplateLookup(directories=["templates/"])
    template = mak_lookup.get_template('phpmanual.mak')
    word = get_request_value(request, 'word')
    now=get_now()
    result = template.render_unicode(
            now=now,
            word=urllib.quote(word)
        )
    return Response(result)

@view_config(route_name='docs_python_jp')
def docs_python_jp(request):
    mak_lookup = TemplateLookup(directories=["templates/"])
    template = mak_lookup.get_template('docs_python_jp.mak')
    word = get_request_value(request, 'word')
    now=get_now()
    result = template.render_unicode(
            now=now,
            word=urllib.quote(word)
        )
    return Response(result)
