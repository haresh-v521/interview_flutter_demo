// To parse this JSON data, do
//
//     final apiResponseModel = apiResponseModelFromJson(jsonString);

import 'dart:convert';

ApiResponseModel apiResponseModelFromJson(String str) => ApiResponseModel.fromJson(json.decode(str));

String apiResponseModelToJson(ApiResponseModel data) => json.encode(data.toJson());

class ApiResponseModel {
  ApiResponseModel({
    this.data,
  });

  List<Datum> data;

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) => ApiResponseModel(
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.eventId,
    this.eventTitle,
    this.eventTime,
    this.eventImage,
    this.eventDescriptio,
    this.eventDate,
    this.isChecked,
  });

  int eventId;
  String eventTitle;
  int eventTime;
  String eventImage;
  String eventDescriptio;
  String eventDate;
  bool isChecked;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    eventId: json["event_id"] == null ? null : json["event_id"],
    eventTitle: json["event_title"] == null ? null : json["event_title"],
    eventTime: json["event_time"] == null ? null : json["event_time"],
    eventImage: json["event_image"] == null ? null : json["event_image"],
    eventDescriptio: json["event_descriptio"] == null ? null : json["event_descriptio"],
    eventDate: json["event_date"] == null ? null : json["event_date"],
    isChecked: false,
  );

  Map<String, dynamic> toJson() => {
    "event_id": eventId == null ? null : eventId,
    "event_title": eventTitle == null ? null : eventTitle,
    "event_time": eventTime == null ? null : eventTime,
    "event_image": eventImage == null ? null : eventImage,
    "event_descriptio": eventDescriptio == null ? null : eventDescriptio,
    "event_date": eventDate == null ? null : eventDate,
    "isChecked": isChecked,
  };
}
