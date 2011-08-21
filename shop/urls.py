from django.conf.urls.defaults import patterns, include, url

urlpatterns = patterns('shop.views',
	url(r'^upload$', 'upload'),
)