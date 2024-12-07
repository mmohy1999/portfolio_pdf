class Resume{
PersonalInformation? personalInformation;
Profile? profile;
List<Education>? educations=[];
List<WorkExperience>? workExperiences=[];
List<Project>? projects=[];
List<Achievement>? achievements=[];
List<Skill>? skills=[];

Resume(
      {this.personalInformation,
      this.profile,
      this.educations,
      this.workExperiences,
      this.projects,
      this.achievements,
      this.skills});
}

class PersonalInformation{
  String name,phone,email,address,linkedIn,gitHub;

  PersonalInformation(this.name, this.phone, this.email, this.address,
      this.linkedIn, this.gitHub);
}

class Profile{
  String profile;
  Profile(this.profile);
}

class Education{
  String degree,university,years;

  Education(this.degree, this.university, this.years);
}

class WorkExperience{
  String position,company,years;

  WorkExperience(this.position, this.company, this.years);
}

class Project{
  String name,details;

  Project(this.name, this.details);
}

class Achievement{
  String name,details;

  Achievement(this.name, this.details);
}

class Skill{
  String skill;

  Skill(this.skill);

}