import 'package:intl/intl.dart';

class BookCardDTO {
  String FolderName;
  String FileName;
  String ThumbNail;
  String DownloadLink;
  String FileSize;
  DateTime CreatedAt;
  BookCardDTO({
    required this.FolderName,
    required this.FileName,
    required this.ThumbNail,
    required this.DownloadLink,
    required this.FileSize,
    required this.CreatedAt,
  });
  factory BookCardDTO.fromJson(Map<String, dynamic> json) {
    final dateFormat = DateFormat("MMMM d, y 'at' h:mm:ss a");

    return BookCardDTO(
      FolderName: json['FolderName'],
      FileName: json['FileName'],
      ThumbNail: json['Thumbnail'],
      DownloadLink: json['DownloadLink'],
      FileSize: json['FileSize'],
      CreatedAt: dateFormat.parse(json['CreatedAt']),
    );
  }
}
