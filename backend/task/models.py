from django.db import models


class Task(models.Model):
    task_name = models.CharField(max_length=255)
    task_detail = models.TextField()
    completed = models.BooleanField(default=False)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.id} - {self.task_name}'