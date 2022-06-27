// ignore_for_file: non_constant_identifier_names, constant_identifier_names

enum BoxType {
  INPA,
  PNN,
  INPA_AIRETAMA,
  HORIZONTAL,
  AF,
  JWC,
}

class BeeColony {
  final String id;
  final String description;
  final String img;
  final String meliponaryId;
  final String beekeeperId;
  final String beeId;
  final BoxType boxType;

  const BeeColony({
    required this.id,
    required this.description,
    required this.img,
    required this.beeId,
    required this.meliponaryId,
    required this.beekeeperId,
    required this.boxType,
  });
}
