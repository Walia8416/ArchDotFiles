from django.test import TestCase
from .models import ToDo
# Create your tests here.


class ToDoModelTest(TestCase):
    @classmethod
    def setUpTestData(cls):
        cls.todo = ToDo.objects.create(
            title='first',
            body='body boy'
        )

    def test_model_content(self):
        self.assertEqual(self.todo.title,"first")
        self.assertEqual(self.todo.body,"body boy")
        self.assertEqual(str(self.todo),"first")