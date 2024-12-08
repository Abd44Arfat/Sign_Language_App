class LearnRes {
  final String message;
  final Level level;

  LearnRes({required this.message, required this.level});

  factory LearnRes.fromJson(Map<String, dynamic> json) {
    return LearnRes(
      message: json['message'],
      level: Level.fromJson(json['level']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'level': level.toJson(),
    };
  }
}

class Level {
  final String id;
  final String name;
  final String category;
  final List<Questions> questions;

  Level({
    required this.id,
    required this.name,
    required this.category,
    required this.questions,
  });

  factory Level.fromJson(Map<String, dynamic> json) {
    var questionList = json['Questions'] as List;
    List<Questions> questionsList = questionList.map((i) => Questions.fromJson(i)).toList();

    return Level(
      id: json['_id'],
      name: json['name'],
      category: json['category'],
      questions: questionsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'category': category,
      'Questions': questions.map((q) => q.toJson()).toList(),
    };
  }
}

class Questions {
  final Signs signs;
  final String id;
  final String level;
  final String question;
  final List<Option> options;
  final String correctOption;
 
 

  Questions({
    required this.signs,
    required this.id,
    required this.level,
    required this.question,
    required this.options,
    required this.correctOption,
  });

  factory Questions.fromJson(Map<String, dynamic> json) {
    var optionsList = json['options'] as List;
    List<Option> options = optionsList.map((i) => Option.fromJson(i)).toList();

    return Questions(
      signs: Signs.fromJson(json['signs']),
      id: json['_id'],
      level: json['level'],
      question: json['question'],
      options: options,
      correctOption: json['correctOption'],
  

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'signs': signs.toJson(),
      '_id': id,
      'level': level,
      'question': question,
      'options': options.map((o) => o.toJson()).toList(),
      'correctOption': correctOption,
    };
  }
}

class Signs {
  final String gifUrl;
  final String text;

  Signs({required this.gifUrl, required this.text});

  factory Signs.fromJson(Map<String, dynamic> json) {
    return Signs(
      gifUrl: json['gifUrl'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gifUrl': gifUrl,
      'text': text,
    };
  }
}

class Option {
  final String text;
  final int score;
  final String id;

  Option({required this.text, required this.score, required this.id});

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      text: json['text'],
      score: json['score'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'score': score,
      '_id': id,
    };
  }
}