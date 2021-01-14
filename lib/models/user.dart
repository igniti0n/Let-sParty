enum FriendshipStatus {
  NotFriends,
  Friends,
  Pending,
}

class User {
  final String username;
  final String imageUrl;
  final String uid;
  final List<dynamic> createdPartyIds;
  final List<dynamic> attendedPartyIds;
  final List<dynamic> friends;
  final List<dynamic> friendRequests;

  User({
    this.username,
    this.imageUrl,
    this.attendedPartyIds,
    this.createdPartyIds,
    this.friends,
    this.uid,
    this.friendRequests,
  });

  factory User.fromMap(Map<String, dynamic> userMap, String uid) {
    if (userMap == null) return null;

    return new User(
      username: userMap['username'],
      imageUrl: userMap['imageUrl'],
      createdPartyIds: userMap['createdPartyIds'],
      attendedPartyIds: userMap['attendedPartyIds'],
      friends: userMap['friends'],
      uid: uid,
      friendRequests: userMap['friendRequests'],
    );
  }

  @override
  String toString() {
    return toMap(this).toString();
  }

  static Map<String, dynamic> toMap(User user) {
    if (user == null) return null;
    return {
      'username': user.username,
      'imageUrl': user.imageUrl,
      'attendedPartyIds': user.attendedPartyIds.toList() as List<String>,
      'createdPartyIds': user.createdPartyIds.toList() as List<String>,
      'friends': user.friends.toList() as List<String>,
      'friendRequests': user.friendRequests.toList() as List<String>,
    };
  }
}
