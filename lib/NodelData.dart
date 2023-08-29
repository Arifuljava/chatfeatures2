class NodelData {
  String? subCategoryName;
  LabelDataList? labelDataList;
  LabelDataView? labelDataView;

  NodelData({this.subCategoryName, this.labelDataList, this.labelDataView});

  NodelData.fromJson(Map<String, dynamic> json) {
    subCategoryName = json['subCategoryName'];
    labelDataList = json['labelDataList'] != null
        ? new LabelDataList.fromJson(json['labelDataList'])
        : null;
    labelDataView = json['LabelDataView'] != null
        ? new LabelDataView.fromJson(json['LabelDataView'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subCategoryName'] = this.subCategoryName;
    if (this.labelDataList != null) {
      data['labelDataList'] = this.labelDataList!.toJson();
    }
    if (this.labelDataView != null) {
      data['LabelDataView'] = this.labelDataView!.toJson();
    }
    return data;
  }
}

class LabelDataList {
  String? contentData;
  String? positionX;
  String? positionY;
  String? widgetWidth;
  String? widgetHeight;
  String? index;
  String? length;
  String? barcodeType;
  String? textSize;
  String? bold;
  String? underline;
  String? fromwhere;
  String? type;
  String? address;

  LabelDataList(
      {this.contentData,
        this.positionX,
        this.positionY,
        this.widgetWidth,
        this.widgetHeight,
        this.index,
        this.length,
        this.barcodeType,
        this.textSize,
        this.bold,
        this.underline,
        this.fromwhere,
        this.type,
        this.address});

  LabelDataList.fromJson(Map<String, dynamic> json) {
    contentData = json['contentData'];
    positionX = json['positionX'];
    positionY = json['positionY'];
    widgetWidth = json['widgetWidth'];
    widgetHeight = json['widgetHeight'];
    index = json['index'];
    length = json['length'];
    barcodeType = json['barcodeType'];
    textSize = json['textSize'];
    bold = json['bold'];
    underline = json['underline'];
    fromwhere = json['fromwhere'];
    type = json['type'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contentData'] = this.contentData;
    data['positionX'] = this.positionX;
    data['positionY'] = this.positionY;
    data['widgetWidth'] = this.widgetWidth;
    data['widgetHeight'] = this.widgetHeight;
    data['index'] = this.index;
    data['length'] = this.length;
    data['barcodeType'] = this.barcodeType;
    data['textSize'] = this.textSize;
    data['bold'] = this.bold;
    data['underline'] = this.underline;
    data['fromwhere'] = this.fromwhere;
    data['type'] = this.type;
    data['address'] = this.address;
    return data;
  }
}

class LabelDataView {
  String? id;
  String? myid;
  String? date;
  String? size;
  String? name;
  String? imagebitmap;

  LabelDataView(
      {this.id, this.myid, this.date, this.size, this.name, this.imagebitmap});

  LabelDataView.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    myid = json['myid'];
    date = json['date'];
    size = json['size'];
    name = json['name'];
    imagebitmap = json['imagebitmap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['myid'] = this.myid;
    data['date'] = this.date;
    data['size'] = this.size;
    data['name'] = this.name;
    data['imagebitmap'] = this.imagebitmap;
    return data;
  }
}
