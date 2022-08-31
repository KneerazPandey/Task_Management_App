from django.urls import path
from . import views


urlpatterns = [
    path('view-all/', views.GetAllTaskAPIView.as_view(), name='view-all'),
    path('create/', views.CreateNewTaskAPIView.as_view(), name='create'),
    path('<int:pk>/', views.GetTaskItemAPIView.as_view(), name='task-item'),
    path('update/<int:pk>/', views.UpdateTaskAPIView.as_view(), name='update'),
    path('delete/<int:pk>/', views.DeleteTaskAPIView.as_view(), name='delete'),
]