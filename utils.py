import re
import commands
import urllib

def browse(url):
    print url
    if url == "":
        url = "http://docs.pylonsproject.jp/projects/pyramid-doc-ja/en/latest/index.html"
    return urllib.urlopen(url).read()

def get_request_value(request, param, default="", encode='utf-8'):
    try:
        var = request.params[param]
    except KeyError:
        var = default
    return unicode(var).encode('utf-8')

def run(command):
    if command=="":
        command = "pwd && ls -F"
    if is_ignore_command(command):
        command = "echo cannot execute '%s'" % command
    print command
    return commands.getoutput(command)

def is_ignore_command(command):
    m = re.match("^([\s]*|.*[\W\s])(rm|sudo)[\s]*",command)
    if m:
        return True
    return False

def is_allowed_ip(remote_addr):
    m = re.match("^(192.168.|10.0.|127.0.)",remote_addr)
    if m:
        return True
    return False

def get_now():
    import datetime
    import locale
    d = datetime.datetime.today()
    return '%04d-%02d-%02d %02d:%02d:%02d' % (d.year, d.month, d.day, d.hour, d.minute, d.second)
