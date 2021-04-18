class Person {
  String name;
  String age;
  String university;
  String location;
  String imageUrl;
  bool likeIcon;
  bool dislikeIcon;

  Person({
    this.name,
    this.age,
    this.university,
    this.location,
    this.imageUrl,
    this.likeIcon,
    this.dislikeIcon,
  });
}

List<Person> people = [
  Person(
    name: 'Paulo',
    age: '19',
    university: 'UMC - Sistemas de Informação',
    location: 'Lives In Suzano',
    imageUrl: 'assets/images/me.jpg',
    dislikeIcon: false,
    likeIcon: false
  ),
  Person(
    name: 'Fellipe',
    age: '27',
    university: 'Uninove - Ciencias da Computação',
    location: 'Lives In Poá',
    imageUrl: 'assets/images/fellipe.jpg',
    dislikeIcon: false,
    likeIcon: false
  ),
  Person(
    name: 'Fernando',
    age: '535435436543564356',
    university: 'Mackenzi - Ciencias da Computação',
    location: 'Lives In Guarulhos',
    imageUrl: 'assets/images/lex.jpg',
    dislikeIcon: false,
    likeIcon: false
  ),
];