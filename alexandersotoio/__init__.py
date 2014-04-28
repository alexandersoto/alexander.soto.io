###############################################################################
# Sets up the application, the "main" function
###############################################################################

import inspect
import os
from subprocess import Popen, PIPE

from pyramid.config import Configurator

# Path of the application
HOME_DIR = os.path.abspath(os.path.split(inspect.getfile(inspect.currentframe()))[0])


def main(global_config, **settings):
    """ Returns our Pyramid WSGI application."""

    # Set to a boolean instead of a string so usage in app is intuitive
    if (settings['is_production'] == 'true'):
        settings['is_production'] = True
    else:
        settings['is_production'] = False

    config = Configurator(settings=settings)
    configure_routes(config, settings)
    return config.make_wsgi_app()


def configure_routes(config, settings):
    """Configures our application's routes and urls.

    Keyword arguments:

    config -- pyramid.config Configurator
    settings -- our app setting  
    """

    # For production we want a long expiration time and a cache buster
    # For development we want to always redownload the assets  
    static_max_age = int(settings['static_max_age'])

    # Apps's git commit will determine url for assets that change frequently
    config.add_static_view('/static/' + get_git_hash(), 'alexandersotoio:static',  cache_max_age=static_max_age)

    # Routes
    config.add_route('home', '/')
    config.scan()


def get_git_hash():
    """ Returns the git hash of the master branch """

    gitproc = Popen(['git', 'show-ref', '--heads', '--abbrev=5'], stdout=PIPE, cwd=HOME_DIR)
    (stdout, stderr) = gitproc.communicate()

    for row in stdout.split('\n'):
        if row.find('master'):
            return row.split()[0]

    return 'ERROR'
