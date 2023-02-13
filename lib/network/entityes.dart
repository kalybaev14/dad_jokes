import 'dart:convert';

class JokesEntity {
  final String Quetions;
  final String Answer;
  JokesEntity({
    required this.Quetions,
    required this.Answer,
  });

  JokesEntity copyWith({
    String? Quetions,
    String? Answer,
  }) {
    return JokesEntity(
      Quetions: Quetions ?? this.Quetions,
      Answer: Answer ?? this.Answer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Quetions': Quetions,
      'Answer': Answer,
    };
  }

  factory JokesEntity.fromMap(Map<String, dynamic> map) {
    return JokesEntity(
      Quetions: map['Quetions'] ?? '',
      Answer: map['Answer'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory JokesEntity.fromJson(String source) => JokesEntity.fromMap(json.decode(source));

  @override
  String toString() => 'JokesEntity(Quetions: $Quetions, Answer: $Answer)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is JokesEntity &&
      other.Quetions == Quetions &&
      other.Answer == Answer;
  }

  @override
  int get hashCode => Quetions.hashCode ^ Answer.hashCode;
}
