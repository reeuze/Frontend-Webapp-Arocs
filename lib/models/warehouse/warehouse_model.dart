class WarehouseModel {
  final int columns;
  final int rows;
  final List<List<TileModel>> maps;

  WarehouseModel({
    required this.maps,
    required this.columns,
    required this.rows,
  });

  WarehouseModel copyWith(
    List<List<TileModel>>? maps,
    int? columns,
    int? rows,
  ) {
    return WarehouseModel(
      maps: maps ?? this.maps,
      columns: columns ?? this.columns,
      rows: rows ?? this.rows,
    );
  }

  factory WarehouseModel.fromMap(Map<String, dynamic> maps){
    return WarehouseModel(
      maps: maps['maps'],
      columns: maps['columns'],
      rows: maps['rows'],
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      'maps': maps,
      'columns': columns,
      'rows': rows,
    };
  }
}



class TileModel {
  final int arucoId;
  final int isPath;

  TileModel({required this.arucoId, required this.isPath});

  TileModel copyWith (
    int? arucoId,
    int? isPath,
  ) {
    return TileModel(
      arucoId: arucoId ?? this.arucoId, 
      isPath: isPath ?? this.isPath
    );
  }

  factory TileModel.fromMap(Map<String, dynamic> maps){
    return TileModel(
      arucoId: maps['arucoId'], 
      isPath: maps['isPath'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'arucoId' : arucoId,
      'isPath' : isPath,
    };
  }
}