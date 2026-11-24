from django.test import SimpleTestCase
from django.urls import reverse


class HelloWorldViewTests(SimpleTestCase):
    def test_returns_hello_world(self):
        response = self.client.get(reverse('hello_world'))

        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.content, b'Hello, world!')
