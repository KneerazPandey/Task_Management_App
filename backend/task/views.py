from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework import generics, status
from . models import Task
from . serializers import TaskSerializer


class GetAllTaskAPIView(generics.GenericAPIView):
    queryset = Task.objects.all()
    serializer_class = TaskSerializer

    def get(self, request: Request) -> Response:
        tasks = self.get_queryset()
        serializer = self.serializer_class(tasks, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)


class CreateNewTaskAPIView(generics.GenericAPIView):
    serializer_class = TaskSerializer

    def post(self, request: Request) -> Response:
        serializer = self.serializer_class(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response({'error': serializer.errors}, status=status.HTTP_400_BAD_REQUEST)


class GetTaskItemAPIView(generics.GenericAPIView):
    serializer_class = TaskSerializer

    def get(self, request: Request, pk: int) -> Response:
        try:
            task = Task.objects.get(id=pk)
            serializer = self.serializer_class(task, many=False)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except Task.DoesNotExist:
            return Response({'error': 'Task not found to be updated'}, status=status.HTTP_400_BAD_REQUEST)

    
class UpdateTaskAPIView(generics.GenericAPIView):
    serializer_class = TaskSerializer

    def put(self, request: Request, pk: int) -> Response:
        try:
            task = Task.objects.get(id=pk)
            serializer = self.serializer_class(task, data=request.data, partial=True)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_200_OK)
            return Response({'error': serializer.errors}, status=status.HTTP_400_BAD_REQUEST)
        except Task.DoesNotExist:
            return Response({'error': 'Task not found to be updated'}, status=status.HTTP_400_BAD_REQUEST)

        
class DeleteTaskAPIView(generics.GenericAPIView):
    serializer_class = TaskSerializer

    def delete(self, request: Request, pk: int) -> Response:
        try:
            task = Task.objects.get(id=pk)
            task.delete()
            return Response({'data': 'Task deleted sucessfully'}, status=status.HTTP_200_OK)
        except Task.DoesNotExist:
            return Response({'error': 'Task not found to be deleted'}, status=status.HTTP_400_BAD_REQUEST)