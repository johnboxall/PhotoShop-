from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from django.views.decorators.csrf import csrf_exempt

from photoshop.shop import forms as shop_forms


@csrf_exempt
def upload(request, template_name='shop/upload.html'):
    if request.method == 'POST':
        form = shop_forms.PhotoForm(request.POST, request.FILES)
        if form.is_valid():
            result = shop_forms.handle_photo(request.FILES['photo'])
            result = result or DEFAULT_ITEM
            return HttpResponseRedirect(result)                
    else:
        form = shop_forms.PhotoForm()
    
    ctx = {
        'form': form
    }
    return render_to_response(template_name, ctx)