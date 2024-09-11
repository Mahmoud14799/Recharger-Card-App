class CardModel {
  CardModel({
    required this.cardImage,
    required this.cardCode,
    required this.nameCard,
    this.codeService = '', // معامل اختياري مع قيمة افتراضية
  });

  String nameCard;
  String cardCode;
  String cardImage;
  String codeService;

  void updateCode(String newCode) {
    cardCode = newCode;
  }
}
