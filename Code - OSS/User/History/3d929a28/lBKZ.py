from django.test import TestCase
from django.contrib.auth import get_user_model
from .models import Post
from django.urls import reverse
# Create your tests here.

class BlogTests(TestCase):

    def setUp(self):
        self.user = get_user_model().objects.create_user(
            username='testuser',
            email='test@email.com',
            password='secret'
        )

        self.post = Post.objects.create(
            title='gg',
            body="this is a post",
            author=self.user,
        )

    def test_string_representation(self):
        post=Post(title='A sample title')
        self.assertEqual(str(post),post.title)

    def test_post_content(self):
        self.assertEqual(f'{self.post.title}','gg')
        self.assertEqual(f'{self.post.body}','this is a post')
        self.assertEqual(f'{self.post.author}','testuser')

    def test_post_list_view(self):
        response = self.client.get(reverse('home'))
        self.assertEqual(response.status_code,200)
        self.assertContains(response,'this is a post')
        self.assertTemplateUsed(response,'home.html')

    def test_post_detail_view(self):
        response = self.client.get(reverse('/post/1/'))
        noresp = self.client.get(reverse('/post/1000/'))
        self.assertEqual(response.status_code,200)
        self.assertEqual(noresp.status_code,404)
        self.assertContains(response,'gg')
        self.assertTemplateUsed(response,'post_detail.html')