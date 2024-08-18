class Delegacia {
  final String id;
  final String nome;
  final String endereco;
  final bool diaTodo;
  final double latitude;
  final double longitude;
  final String mapUrl;

  Delegacia({
    required this.id,
    required this.nome,
    required this.endereco,
    required this.diaTodo,
    required this.latitude,
    required this.longitude,
    required this.mapUrl
  });

  factory Delegacia.fromMap(Map<String, dynamic> map) {
    return Delegacia(
      id: map['id'],
      nome: map['nome'],
      endereco: map['endereco'],
      diaTodo: map['diaTodo'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      mapUrl: map['mapUrl']
    );
  }
}
