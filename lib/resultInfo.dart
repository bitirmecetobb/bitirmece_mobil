enum FruitType { apple, orange, banana, tomato, cucumber}
Map <FruitType, String> FruitNames = {
  FruitType.apple : "Elma",
  FruitType.orange : "Portakal",
  FruitType.banana : "Muz"
};

class ResultInfo {
  DateTime timestamp;
  Map<FruitType, int> fruitData;

  ResultInfo({required this.timestamp, required this.fruitData});
}
