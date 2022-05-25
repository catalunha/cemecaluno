abstract class CourseRepository {
  Future<void> list();
  Future<void> create(CourseEntity contactModel);
  Future<void> update(CourseEntity contactModel);
  Future<void> delete(String id);
}
