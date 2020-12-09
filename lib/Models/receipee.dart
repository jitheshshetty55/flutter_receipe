//Model class used for Receipee
class ReceipeeList {
  final String name;
  final String description;
  final String imageURL;
  final String subtext;
  List<Details> details;
  List<String> steps;



  ReceipeeList(
      {this.name, this.description, this.imageURL, this.subtext, this.details,this.steps});

  //Parsing the JSON and keeping the values
  factory ReceipeeList.fromJSON(Map<String, dynamic> json) {
    return ReceipeeList(
      name: json["fn"],
      description: json["dc"],
      subtext: json["cn"],
      imageURL: json["pf"],
      details:  List<Details>.from(json["ig"].map((x) => Details.fromJson(x))),
      steps: List<String>.from(json["in"].map((x) => x)),

    );
  }

}

class Details {
  final String quantity;
  final String itemname;

  Details({this.quantity, this.itemname});
  factory Details.fromJson(Map<String, dynamic> json){
    return Details(
        itemname: json['n'],
        quantity: json['c']
    );
  }


}


