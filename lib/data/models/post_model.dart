import 'package:test_app/core/entities/post.dart';

class PostModel extends Post {
  PostModel({
    required super.id,
    required super.title,
    required super.category,
    required super.slug,
    required super.url,
    required super.content,
    required super.image,
    required super.thumbnail,
    required super.status,
    required super.publishedAt,
    required super.updatedAt,
    required super.userId,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      slug: json['slug'],
      title: json['title'],
      category: json['category'],
      url: json['url'],
      content: json['content'],
      image: json['image'],
      thumbnail: json['thumbnail'],
      status: json['status'],
      publishedAt: json['publishedAt'],
      updatedAt: json['updatedAt'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'slug': slug,
      'url': url,
      'content': content,
      'image': image,
      'thumbnail': thumbnail,
      'status': status,
      'publishedAt': publishedAt,
      'updatedAt': updatedAt,
      'userId': userId,
    };
  }
}
