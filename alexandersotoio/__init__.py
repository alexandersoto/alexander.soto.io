###############################################################################
# Sets up the application, the "main" function
###############################################################################

from pyramid.config import Configurator

# Every project route name / mako / url will be based on this string
PROJECTS = ['tunessence', 'seam-carving', 'chess-bot', 'connect-four', 'mips-processor']

# TODO - coprocessor project

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

    # For production we want a long expiration time
    # For development we want to always redownload the assets
    static_max_age = int(settings['static_max_age'])
    config.add_static_view('/static', 'alexandersotoio:static', cache_max_age=static_max_age)

    # Routes
    config.add_route('home', '/')
    config.add_view(route_name='home', renderer='home.mako')

    for project in PROJECTS:
        config.add_route(project, '/' + project)
        config.add_view(route_name=project, renderer=project + '.mako')
