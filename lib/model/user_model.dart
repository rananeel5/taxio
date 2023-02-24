class UserModel {
  String userName = '';
  String? picture;
  String? country;
  String? city;

  String get getInitials {
    List<String> nameParts = userName.trim().split(' ');
    if (nameParts.length > 1) {
      return nameParts[0].substring(0, 1).toUpperCase() +
          nameParts[1].substring(0, 1).toUpperCase();
    } else {
      if (nameParts[0].isEmpty) {
        return '*';
      }
      return nameParts[0].substring(0, 1).toUpperCase();
    }
  }
}