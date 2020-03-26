
import 'package:is_coding_task/model/bike_item.dart';


List<BikeItem> bikes = [
  BikeItem(
      id : "1",
      frameSize:  "M",
      category: "Commuting",
      location: "Stuttgart",
      name: "Cube Town Hybrid Pro 500",
      photoUrl: "https://images.internetstores.de/products//1066124/02/98ba28/Cube_Town_Hybrid_Pro_500_Easy_Entry_black_n_green[640x480].jpg?forceSize=true&forceAspectRatio=true&useTrim=true",
      priceRange: "Normal",
      description: "Great bike for everyday usage, especially for commuting to work or doing grocery shopping."
  ),


  BikeItem(
    id: "2",
    frameSize: "L",
    category: "Mountain",
    location: "Stuttgart",
    name: "Cube Acid Hybrid One 500",
    photoUrl: "https://images.internetstores.de/products//1064879/02/e7386b/Cube_Acid_Hybrid_One_500_Allroad_Trapez_black_n_green[640x480].jpg?forceSize=true&forceAspectRatio=true&useTrim=true",
    priceRange: "Normal",
    description: "Great bike for doing sports or riding in mountains."
  ),

  BikeItem(
    id: "3",
    frameSize: "L",
    category: "Road",
    location: "Stuttgart",
    name: "Cube Reaction Hybrid EX 500",
    photoUrl: "https://images.internetstores.de/products//1065683/02/f1ab9c/Cube_Reaction_Hybrid_EX_500_Allroad_black_n_blue[640x480].jpg?forceSize=true&forceAspectRatio=true&useTrim=true",
    priceRange: "Normal",
    description: "Great bike for everyday usage."
  ),
  BikeItem(
    id: "4",
    frameSize: "L",
    category: "Hybrid",
    location: "Stuttgart",
    name: "Cube Touring Hybrid EXC 500",
    photoUrl: "https://images.internetstores.de/products//1066019/02/0af2f2/Cube_Touring_Hybrid_EXC_500_Trapez_iridium_n_green[640x480].jpg?forceSize=true&forceAspectRatio=true&useTrim=true",
    priceRange: "Expensive",
    description: "Great bike for all-round usage, from commuting to work to more sport-wise usage."),

];

List<String>frameSizes = [
  "S",
  "M",
  "L"
];

List<String> priceRange = [
  "Cheap",
  "Normal",
  "Expensive"
];