from django.contrib import admin
from .models import ToDo
# Register your models here.

class TodoAdmin(admin.ModelAdmin):
    list_display = (
        "title",
        "body",
    )

admin.site.register(ToDo,TodoAdmin)