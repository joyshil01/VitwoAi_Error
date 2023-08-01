///simple class representing the user id and email
class AppUser {
  final String email;
  final String passWord;
  final String token;
  const AppUser({
    required this.email,
    required this.passWord,
    required this.token,
  });
}
