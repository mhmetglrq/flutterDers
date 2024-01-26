// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostModel {
  int id;
  String profilePhotoUrl;
  String creator;
  int likeCount;
  String contentUrl;
  PostModel({
    required this.id,
    required this.profilePhotoUrl,
    required this.creator,
    required this.likeCount,
    required this.contentUrl,
  });

  PostModel copyWith({
    int? id,
    String? profilePhotoUrl,
    String? creator,
    int? likeCount,
    String? contentUrl,
  }) {
    return PostModel(
      id: id ?? this.id,
      profilePhotoUrl: profilePhotoUrl ?? this.profilePhotoUrl,
      creator: creator ?? this.creator,
      likeCount: likeCount ?? this.likeCount,
      contentUrl: contentUrl ?? this.contentUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'profilePhotoUrl': profilePhotoUrl,
      'creator': creator,
      'likeCount': likeCount,
      'contentUrl': contentUrl,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] as int,
      profilePhotoUrl: map['profilePhotoUrl'] as String,
      creator: map['creator'] as String,
      likeCount: map['likeCount'] as int,
      contentUrl: map['contentUrl'] as String,
    );
  }

  @override
  String toString() {
    return 'PostModel(id: $id, profilePhotoUrl: $profilePhotoUrl, creator: $creator, likeCount: $likeCount, contentUrl: $contentUrl)';
  }

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.profilePhotoUrl == profilePhotoUrl &&
        other.creator == creator &&
        other.likeCount == likeCount &&
        other.contentUrl == contentUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        profilePhotoUrl.hashCode ^
        creator.hashCode ^
        likeCount.hashCode ^
        contentUrl.hashCode;
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
