class User {
  final String username;
  final String imageUrl;
  List<String> createdPartyIds;
  List<String> attendedPartyIds;
  List<String> friends;

  User({
    this.username,
    this.imageUrl,
    this.attendedPartyIds,
    this.createdPartyIds,
    this.friends,
  });

  factory User.fromMap(Map<String, dynamic> userMap) {
    return new User(
      username: userMap['username'],
      imageUrl: userMap['imageUrl'],
      createdPartyIds: userMap['createdPartyIds'],
      attendedPartyIds: userMap['attendedPartyIds'],
      friends: userMap['friends'],
    );
  }

  static Map<String, dynamic> toMap(User user) {
    return {
      'username': user.username,
      'imageUrl': user.imageUrl,
      'attendedPartyIds': user.attendedPartyIds,
      'createdPartyIds': user.createdPartyIds,
      'friends': user.friends,
    };
  }
}
