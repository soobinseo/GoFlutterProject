class UserDetail {
  int id;
  String name = "";
  String image = "";
  String title = "";
  String introduce = "";
  int userId;
  List<Career> careers = new List<Career>();
  List<Education> educations = new List<Education>();

  UserDetail({this.id, this.name, this.image, this.title, this.introduce, this.userId, this.careers, this.educations});

  UserDetail.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    userId = json['userId'];
    image = json['image'];
    name = json['name'];
    title = json['title'];
    introduce = json['introduce'];
    careers = json['careers'];
    educations = json['educations'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    data['introduce'] = this.introduce;
    data['careers'] = this.careers;
    data['educations'] = this.educations;
    data['userId'] = this.userId;
    data['id'] = this.id;
    return data;
  }
}

class Career {
  int id;
  int userDetailId;
  String company;
  String title;

  Career({this.id, this.userDetailId, this.company, this.title});

  Career.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userDetailId = json['userDetailId'];
    company = json['company'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userDetailId'] = this.userDetailId;
    data['company'] = this.company;
    data['title'] = this.title;
    return data;
  }
}

class Education {
  int id;
  int userDetailId;
  String university;
  String major;

  Education({this.id, this.userDetailId, this.university, this.major});

  Education.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userDetailId = json['userDetailId'];
    university = json['university'];
    major = json['major'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userDetailId'] = this.userDetailId;
    data['university'] = this.university;
    data['major'] = this.major;
    return data;
  }
}
