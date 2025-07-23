class BookCardDTO {
  String FolderName;
  String FileName;
  String ThumbNail;
  String DownloadLink;
  String FileSize;
  String CreatedAt;
  BookCardDTO({
    required this.FolderName,
    required this.FileName,
    required this.ThumbNail,
    required this.DownloadLink,
    required this.FileSize,
    required this.CreatedAt,
  });
  factory BookCardDTO.fromJson(Map<String, dynamic> json) {
    return BookCardDTO(
      FolderName: json['FolderName'],
      FileName: json['FileName'],
      ThumbNail: json['Thumbnail'],
      DownloadLink: json['DownloadLink'],
      FileSize: json['FileSize'],
      CreatedAt: json['CreatedAt'],
    );
  }
}
