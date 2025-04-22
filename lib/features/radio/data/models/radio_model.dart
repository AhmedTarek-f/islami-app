class RadioModel{
  RadioModel({
    required this.id,
    required this.radioChannelName,
    required this.radioChannelUrl,
    required this.recentData,
    this.isPlaying = false,
    this.isSoundOn = true,
  });
  final int id;
  final String radioChannelName;
  final String radioChannelUrl;
  final String? recentData;
  bool isPlaying;
  bool isSoundOn;

  static RadioModel empty() => RadioModel(id: 0, radioChannelName: "", radioChannelUrl: "", recentData: "");

  Map<String,dynamic> toJson(){
    return{
      "id":id,
      "name":radioChannelName,
      "url":radioChannelUrl,
      "recent_date": recentData,
    };
  }

  factory RadioModel.fromJson(Map<String,dynamic> data){
    if(data.isNotEmpty){
      return RadioModel(
          id: data["id"] as int,
          radioChannelName: data["name"] as String,
          radioChannelUrl: data["url"] as String,
          recentData: data["recent_date"] as String?
      );
    }
    else{
      return empty();
    }
  }
}