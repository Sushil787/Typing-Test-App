void main() {
  SuperUser sushil = SuperUser("sushil", 22);
  print(sushil.name);
  print(sushil.age);
  sushil.login();
  sushil.publish();
}

class user {
  String name;
  int age;
  user(this.name, this.age);

  void login() {
    print("user $name login in this device");
  }
}

class SuperUser extends user {
  String name;
  int age;
  SuperUser(this.name, this.age) : super(name, age);
  void publish() {
    print(" i just publish");
  }
}
