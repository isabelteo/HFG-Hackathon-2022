class User {
  final String imagePath;
  final String name;
  final String country;
  final String about;
  final String job;
  final String hobbies;
  final String birthday;
  final String housing;
  final bool isDarkMode;

  const User({
    required this.imagePath,
    required this.name,
    required this.country,
    required this.about,
    required this.housing,
    required this.job,
    required this.hobbies,
    required this.birthday,
    required this.isDarkMode,
  });
}