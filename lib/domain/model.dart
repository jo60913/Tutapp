
class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class Customer{
  String id;
  String name;
  int numOfNotifications;
  Customer(this.id,this.name,this.numOfNotifications);
}

class Contacts{
  String email;
  String phone;
  String line;
  Contacts(this.email,this.phone,this.line);
}

class Authentication{
  Customer? customer;
  Contacts? contacts;
  Authentication(this.customer,this.contacts);
}