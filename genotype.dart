class Genotype {
  late final String _genotype;

  Genotype(this._genotype) {
    if(!['AA', 'Ai', 'BB', 'Bi', 'AB', 'ii'].contains(_genotype)) {
      throw ArgumentError('Genotype Invalid');
    }
  }

  String get bloodType {
    if(_genotype == 'AB') {
      return 'AB';
    } else if(_genotype == 'ii') {
      return 'O';
    } else {
      return _genotype[0];
    }
  }

  List<String> get alleles {
    return _genotype.split('');
  }

  List<String> get agglutinogens {
    List<String> agglutinogens = [];
    if(_genotype.contains('A')) {
      agglutinogens.add('A');
    }
    if(_genotype.contains('B')) {
      agglutinogens.add('B');
    }
    return agglutinogens;
  }

  List<String> get agglutinins {
    List<String> agglutinins = [];
    if(_genotype.contains('i')) {
      agglutinins.add('A');
      agglutinins.add('B');
    }
    return agglutinins;
  }

  List<Genotype> offsprings(Genotype other) {
    List<Genotype> offsprings = [];

    for(var allele1 in alleles) {
      for(var allele2 in other.alleles) {
        offsprings.add(Genotype(allele1 + allele2));
      }
    }

    return offsprings;
  }

  bool compatible(Genotype other) {
    return !agglutinins.any((agglutinin) => other.agglutinogens.contains(agglutinin));
  }

  @override
  String toString() {
    return _genotype;
  }
}

class Individual {
  final String _name;
  final Genotype _genotype;

  static int _counter = 1;

  Individual(String genotype, [String? name]) : _name = name ?? 'Indiv${_counter++}', _genotype = Genotype(genotype);

  String get name => _name;

  Genotype get genotype => _genotype;

  @override
  String toString() {
    return '$_name(${_genotype.bloodType})';
  }
}