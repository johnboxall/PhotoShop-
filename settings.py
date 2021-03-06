import os


DEBUG = True
INSTALLED_APPS = ('photoshop',)
ROOT_PATH = reduce(lambda x, y: x + '/'+ y, os.path.abspath(__file__).split('/')[:-2])
ROOT_URLCONF = 'photoshop.urls'
TEMPLATE_LOADERS = ('django.template.loaders.app_directories.Loader',)
TEMPLATE_DIRS = (os.path.join(ROOT_PATH, 'templates/'),)

# APP SPECIFIC

SHOPIFY_URL = 'http://stamm-sipes9292.myshopify.com/products/'
TINEYE_URL = 'http://pixmatch-m.hackdays.tineye.com/rest/'
DEFAULT_ITEM = 'http://stamm-sipes9292.myshopify.com/products/cellmap'
