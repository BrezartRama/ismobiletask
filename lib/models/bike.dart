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

  Bike.fromJson(Map<String, dynamic> json):
  this.id = json['id'],
  this.frameSize = json['frameSize'],
  this.category = json['category'],
  this.location = json['location'],
  this.name = json['name'],
  this.imageUrl = json['photoUrl'],
  this.priceRange = json['priceRange'],
  this.description = json['description'];

  Map<String, dynamic> toJson() =>{
    'id': this.id,
    'frameSize': this.frameSize,
    'category' : this.category,
    'location' : this.location,
    'name': this.name,
    'photoUrl' : this.imageUrl,
    'priceRange': this.priceRange,
    'description': this.description
  };

}
