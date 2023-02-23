class Character {
  final int id;
  final String name;
  final String species;
  final String image;

  const Character(this.id, this.name, this.species, this.image);

  factory Character.fromDoc(Map doc) {
    return Character(
      doc["id"],
      doc["name"],
      doc["species"],
      doc["image"],
    );
  }
}
