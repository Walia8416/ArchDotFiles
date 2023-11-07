from django.shortcuts import render
from rest_framework import generics
from .models import Post
from django.contrib.auth import get_user_model
from .serializers import PostSerializer,UserSerializer
from .permissions import IsAuthorOrReadOnly
# Create your views here.

class PostList(generics.ListCreateAPIView):
    queryset = Post.objects.all()
    serializer_class = PostSerializer

class PostDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Post.objects.all()
    permission_class = (IsAuthorOrReadOnly,)
    serializer_class=PostSerializer

class UserList(generics.ListCreateAPIView): # new
    queryset = get_user_model().objects.all()
    serializer_class = UserSerializer
class UserDetail(generics.RetrieveUpdateDestroyAPIView): # new
    queryset = get_user_model().objects.all()
    serializer_class = UserSerializer