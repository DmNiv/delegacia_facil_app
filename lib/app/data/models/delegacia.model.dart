class Delegacia {
  final int id;
  final String nome;
  final String endereco;
  final String tipo;
  final bool horario24h;
  final double latitude;
  final double longitude;

  Delegacia({
    required this.id,
    required this.nome,
    required this.endereco,
    required this.tipo,
    required this.horario24h,
    required this.latitude,
    required this.longitude,
  });

  factory Delegacia.fromMap(Map<String, dynamic> map) {
    return Delegacia(
      id: map['id'],
      nome: map['nome'],
      endereco: map['endereco'],
      tipo: map['tipo'],
      horario24h: map['horario24h'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}
