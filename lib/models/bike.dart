class Bike {
  final int id;
  final String frameSize;
  final String category;
  final String location;
  final String name;
  final String imageUrl;
  final String priceRange;
  final String description;

  const Bike({
    this.id,
    this.frameSize,
    this.category,
    this.location,
    this.name,
    this.imageUrl,
    this.priceRange,
    this.description,
  });

  Bike.fromMap(Map<String, dynamic> map):
    this.id = map['id'],
    this.frameSize = map['frameSize'], // update fields
    this.category = map['category'],
    this.location = map['location'],
    this.name = map['name'],
    this.imageUrl = map['photoUrl'],
    this.priceRange = map['priceRange'],
    this.description = map['description'];

  Map<String, dynamic> toMap() =>{
    'id': this.id,
    'frame_size': this.frameSize,
    'category' : this.category,
    'location' : this.location,
    'name': this.name,
    'photo_url' : this.imageUrl,
    'price_range': this.priceRange,
    'description': this.description
  };

}
