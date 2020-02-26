class Person {
  String name;
  String age;
  String university;
  String location;
  String imageUrl;

  Person({
    this.name,
    this.age,
    this.university,
    this.location,
    this.imageUrl,
  });
}

List<Person> people = [
  Person(
    name: 'Paulo Cesar',
    age: '19',
    university: 'UMC - Sistemas de Informação',
    location: 'Lives In Suzano',
    imageUrl: 'assets/images/me.jpg'
  ),
  Person(
    name: 'Fellipe Barros',
    age: '27',
    university: 'Uninove - Ciencias da Computação',
    location: 'Lives In Poá',
    imageUrl: 'assets/images/fellipe.jpg'
  ),
  Person(
    name: 'Fernando Lex',
    age: '41',
    university: 'Mackenzi - Ciencias da Computação',
    location: 'Lives In Guarulhos',
    imageUrl: 'assets/images/lex.jpg'
  ),
];