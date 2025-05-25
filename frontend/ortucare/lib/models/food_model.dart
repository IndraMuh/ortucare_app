class FoodModel {
  final String poster, hook, hook_desc, time, description, writer;
  final int id, stock;

  FoodModel({
    required this.id,
    required this.poster,
    required this.hook,
    required this.hook_desc,
    required this.time,
    required this.description,
    required this.stock,
    required this.writer,
  });
}

class FoodController {
  final List<FoodModel> food = [
    FoodModel(
      id: 1,
      poster: 'meal1.png',
      hook: 'Chicken and Vegetables',
      hook_desc: "Healthy breakfast for your kids",
      time: 'Breakfast',
      description:
          "Holmes is known for his brilliant intellect, unique methods of deduction, and his ability to notice the smallest details that others often overlook. Each story typically begins with a mysterious case—whether it's a murder, theft, or other crime—that appears impossible to solve. Watson, who often serves as the narrator, records their adventures and provides insight into Holmes's extraordinary abilities.",
      stock: 9,
      writer: 'Sir Arthur Conan',
    ),
    FoodModel(
      id: 2,
      poster: 'meal2.png',
      hook: 'Bento Box',
      hook_desc: "Healthy lunch for your kids",
      time: "Lunch",
      description:
          "The story picks up where Dilan 1990 left off, focusing on the evolving relationship between Dilan and Milea. After officially becoming a couple, they face new challenges that test their bond. Milea worries about Dilan's involvement in his motorcycle gang and his frequent brawls, fearing for his safety. Her attempts to distance him from his risky activities lead to tensions and misunderstandings between them.",
      stock: 8,
      writer: 'Pidi Baiq',
    ),
    FoodModel(
      id: 3,
      poster: 'meal3.png',
      hook: "Chicken Soup",
      hook_desc: "Healthy dinner for your kids",
      time: 'Dinner',
      description:
          "Harry Potter is an eleven-year-old boy who has been living a difficult life with his abusive aunt, uncle, and cousin, the Dursleys, after the mysterious death of his parents. On his eleventh birthday, Harry learns that he is actually a wizard and is invited to attend Hogwarts School of Witchcraft and Wizardry. Hagrid, a giant of a man and the Keeper of Keys at Hogwarts, reveals to Harry that his parents were famous wizards who were killed by the dark wizard Lord Voldemort. Harry also learns that he survived Voldemort's attack as a baby, leaving him with a lightning-shaped scar on his forehead.",
      stock: 8,
      writer: 'J.K. Rowling',
    ),
    FoodModel(
      id: 4,
      poster: 'meal4.png',
      hook: "Muffin",
      hook_desc: "Healthy snack for your kids",
      time: 'Snack',
      description:
          "The story follows Peter Parker, a shy and intelligent high school student living in New York City with his Aunt May and Uncle Ben. Peter's life changes dramatically when he is bitten by a radioactive spider during a school field trip. The bite grants him superhuman abilities, including enhanced strength, agility, the ability to cling to walls, and a heightened 'spider-sense' that warns him of danger.",
      stock: 8,
      writer: 'Stan Lee',
    ),
  ];
}
