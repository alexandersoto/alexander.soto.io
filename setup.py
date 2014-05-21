import os

from setuptools import setup, find_packages

requires = [
    'pyramid              == 1.5',    # Web framework
    'pyramid_mako         == 1.0.2',  # Templating library
    'pyramid_debugtoolbar == 2.0.2',  # Used by pyramid for debugging toolbar
    'waitress             == 0.8.9'   # Python WSGI server
]

setup(name='AlexanderSotoIo',
      packages=find_packages(),
      include_package_data=True,
      zip_safe=False,
      install_requires=requires,
      tests_require=requires,
      test_suite="alexandersotoio",
      entry_points="""\
      [paste.app_factory]
      main = alexandersotoio:main
      """,
)
