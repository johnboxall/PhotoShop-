import pprint
import simplejson
import urllib2

import MultipartPostHandler

from django import forms
from django.conf import settings


class PhotoForm(forms.Form):
    photo  = forms.FileField()


def handle_photo(f):
    print 'Saving photo locally.'    
    filepath = '/tmp/photo.jpg'
    destination = open(filepath, 'wb+')
    for chunk in f.chunks():
        destination.write(chunk)
    destination.close()

    print 'Requesting matches from Tineye.'    
    opener = urllib2.build_opener(MultipartPostHandler.MultipartPostHandler)
    params = {
        'method': 'search',
        'image': open(filepath, 'rb')
    }
    response = opener.open(settings.TINEYE_URL, params)
    json_str = response.read()
    json_obj = simplejson.loads(json_str)

    print 'Got results from Tineye:'    
    pprint.pprint(json_obj)
    results = json_obj['result']
    for result in results:
        match = result['filename']
        if match.startswith('/photoshop_'):
            slug = match.split('_')[1]
            return settings.SHOPIFY_URL + slug
    return False