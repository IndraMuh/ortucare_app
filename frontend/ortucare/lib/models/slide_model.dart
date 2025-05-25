class SlideModel {
  final String poster, hook, hook_desc;
  final int id;

  SlideModel(
      {required this.id,
      required this.poster,
      required this.hook,
      required this.hook_desc});
}

class SlideController {
  final List<SlideModel> slide = [
    SlideModel(
      id: 1,
      poster: 'article1.png',
      hook: 'How to parenting?',
      hook_desc:
          "Effective parenting means nurturing and supporting your child's growth while setting clear boundaries and expectations.",
    ),
    SlideModel(
      id: 2,
      poster: 'article2.png',
      hook: 'Understanding Teenagers',
      hook_desc:
          "Learn how to communicate better with teens and understand their world without judgment.",
    ),
    SlideModel(
      id: 3,
      poster: 'article5.png',
      hook: "Balancing Work and Family",
      hook_desc:
          "Discover strategies to maintain a healthy balance between career responsibilities and quality family time.",
    ),
    SlideModel(
      id: 4,
      poster: 'article3.png',
      hook: "Building Child Confidence",
      hook_desc:
          "Support your child’s self-esteem by celebrating small wins and encouraging their efforts, not just outcomes.",
    ),
    SlideModel(
      id: 5,
      poster: 'article4.png',
      hook: 'Digital Parenting in Modern Age',
      hook_desc:
          "Guide your children through the digital world with safe screen time habits and responsible online behavior.",
    )
  ];
}
