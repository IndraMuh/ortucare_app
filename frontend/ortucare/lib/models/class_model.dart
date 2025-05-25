class ClassModel {
  final String title;
  final String subtitle;
  final String teacher;
  final String iconAsset;
  final bool isFilled;

  ClassModel({
    required this.title,
    required this.subtitle,
    required this.teacher,
    required this.iconAsset,
    required this.isFilled,
  });
}

// Data list class yang bisa langsung dipanggil di ClassPage
List<ClassModel> classList = [
  ClassModel(
    title: "How to make children happy",
    subtitle: "Basics of parenting",
    teacher: "Ms. Linda",
    iconAsset: "assets/class.png",
    isFilled: true,
  ),
  ClassModel(
    title: "Positive Discipline",
    subtitle: "Encouraging children",
    teacher: "Mr. David",
    iconAsset: "assets/class2.png",
    isFilled: false,
  ),
  ClassModel(
    title: "Teen Talk",
    subtitle: "Understanding your teens",
    teacher: "Mrs. Ana",
    iconAsset: "assets/class3.png",
    isFilled: false,
  ),
];
