class MovieGenre {
  const MovieGenre({required this.id, required this.name});

  final int id;
  final String name;

  factory MovieGenre.fromJSON(Map map) {
    var id = map['id'];
    var name = map['name'];
    return MovieGenre(id: id, name: name);
  }
}
