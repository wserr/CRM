class Endpoints
{
  static String getStudentsEndpoint() => '/Students';

  static String getStudentDetailEndpoint(int id) => '/Students/' + id.toString();
}