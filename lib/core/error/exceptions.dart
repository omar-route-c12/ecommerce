abstract class AppException implements Exception {
  final String message;

  const AppException([this.message = 'Something went wrong..']);
}

class LocalException extends AppException {
  const LocalException([super.message = 'A local error occurred.']);
}

class RemoteException extends AppException {
  const RemoteException([super.message = 'A remote error occurred.']);
}
