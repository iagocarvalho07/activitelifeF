class UserModelEntity {
  String Username = "UserName";
  String idade = "Idade";
  String genero = "genero";
  String altura = "Altura";
  String peso = "peso";
  String idioma = "idioma";
  String tempoTreino = "tempoTreino";
  String experiencia = "peso";
  String frequencia = "5";
  String objetivo = "objetivo";

  UserModelEntity({
    required this.Username,
    required this.idade,
    required this.genero,
    required this.altura,
    required this.peso,
    required this.idioma,
    required this.tempoTreino,
    required this.experiencia,
    required this.frequencia,
    required this.objetivo,
  });

  factory UserModelEntity.fromJson(Map<String, dynamic> json) {
    return UserModelEntity(
      Username: json["Username"],
      idade: json["idade"],
      genero: json["genero"],
      altura: json["altura"],
      peso: json["peso"],
      idioma: json["idioma"],
      tempoTreino: json["tempoTreino"],
      experiencia: json["experiencia"],
      frequencia: json["frequencia"],
      objetivo: json["objetivo"],
    );
  }
}
