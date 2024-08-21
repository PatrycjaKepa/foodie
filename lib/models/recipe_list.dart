class ToDo{
  String? id;
  String? todoText;
  bool isDone;

ToDo({
  required this.id,
  required this.todoText,
  this.isDone = false,
});

static List<ToDo> todoList() {
  return [
    ToDo(id: '1', todoText: 'Schab', isDone: true),
    ToDo(id: '2', todoText: 'Schab2'),
  ];
}
}

// Future data() async {
//     final url = Uri.parse('http://$ADRES:8080/api/v1/user/recipe');
//     final res = await http.get(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//         'accept': 'application/json',
//         'authorization': ACTIVE_USER.getAuthenticationKey()},
//     );
//     List<RecipeList> items = [];
//     if(res.statusCode == 200) {
      
//       items.forEach((element) {
//         recipeItem.add(element.name);
//       });
//     }else {
//       print('ND');
//     }
//   }

// recipeList() {
//   return [];
// }