class Place {
  String name;
  String description;
  String imageUrl;
  bool visited;

  // Constructor used to initialize a Place object
  // The "visited" field is optional and defaults to false
  Place({
    required this.name,
    required this.description,
    required this.imageUrl,
    this.visited = false,
  });
}
