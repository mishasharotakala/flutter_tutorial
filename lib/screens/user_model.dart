class User{
  final String id;
  final String username;
  final String imagePath;
  final int followers;
  final int following;
  final int likes;

  User({
    required this.id,
    required this.username,
    required this.imagePath,
    required this.followers,
    required this.following,
    required this.likes,
  });

  static List<User> users = [
    User(
      id: '1', 
      username: 'Avhatame', 
      imagePath: 'assets/images/a.png', 
      followers: 100, 
      following: 100, 
      likes: 50,
    ),

    User(
      id: '2', 
      username: 'Rodzula', 
      imagePath: 'assets/images/c.png', 
      followers: 200, 
      following: 200, 
      likes: 500,
    ),

    User(
      id: '3', 
      username: "Rotakala", 
      imagePath: 'assets/images/d.png', 
      followers: 1000, 
      following: 1000, 
      likes: 5000,
    ),

    User(
      id: '4', 
      username: 'Rothe', 
      imagePath: 'assets/images/e.png', 
      followers: 10, 
      following: 10, 
      likes: 50,
    ),

    User(
      id: '5', 
      username: 'Shakani', 
      imagePath: 'assets/images/f.png', 
      followers: 100, 
      following: 100, 
      likes: 50,
    ),

    User(
      id: '6', 
      username: 'Lebogang', 
      imagePath: 'assets/images/g.png', 
      followers: 200, 
      following: 200, 
      likes: 500,
    ),

    User(
      id: '7', 
      username: 'Camille', 
      imagePath: 'assets/images/h.png', 
      followers: 1000, 
      following: 1000, 
      likes: 5000,
    ),

    User(
      id: '8', 
      username: 'Ashnee', 
      imagePath: 'assets/images/i.png', 
      followers: 10, 
      following: 10, 
      likes: 50,
    ),
  ];
}