class FireUser {
  final String id;
  final String fullName;
  final String email;
  final String userRole;
  FireUser({
    this.id,
    this.fullName,
    this.email,
    this.userRole,
  });

  FireUser.fromData(Map<String, dynamic> data)
      : id = data['id'] as String,
        fullName = data['fullName'] as String,
        email = data['email'] as String,
        userRole = data['userRole'] as String;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'userRole': userRole,
    };
  }
}
