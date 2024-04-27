class Candidate {
  String? name;
  String? surname;
  String? description;
  /*String? birthDate;
  String? sex;
  String? profil;
  Person? spouse;*/

  Candidate({this.name, this.surname}); /* this.birthDate, this.sex*/

  @override
  String toString() {
    return 'Person{name: $name, surname: $surname, description: $description }'; /*birthDate: $birthDate, sex: $sex*/
  }


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'surname': surname,
      'description': description,
      //'birthDate': birthDate,
      //'sex': sex,
      //'profil': profil,
      //'spouse': spouse,
    };
  }
}
