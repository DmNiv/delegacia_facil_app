import 'package:delegacia_facil_app/app/data/models/delegacia.model.dart';

abstract interface class IDelegaciaRepository {
  Future<List<Delegacia>> getDelegacias();
  Future<List<Delegacia>> getDelegacias24h();
  Future<List<Delegacia>> getDelegaciasPorTipo(List<String> tipos);
}