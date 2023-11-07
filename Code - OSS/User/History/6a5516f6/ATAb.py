from django.shortcuts import render
from rest_framework import generics
from .models import Post
from rest_framework.permissions import IsAdminUser
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
    # permission_class = [IsAdminUser]
    queryset = get_user_model().objects.all()
    serializer_class = UserSerializer
class UserDetail(generics.RetrieveUpdateDestroyAPIView): # new
    queryset = get_user_model().objects.all()
    # permission_class = [IsAdminUser]
    serializer_class = UserSerializer