import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import '../../utils/constants/app_strings.dart';
import 'source.dart';

@Entity(tableName: articlesTableName) // used for Dao to mark article as entity
class Article extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  Article(
      {this.id,
      this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['id'] as int?,
      source: Source(name: map['source']['name'],id:map['source']['id'] ),
      author: map['author'] as String?,
      title: map['title'] as String?,
      description: map['description'] as String?,
      url: map['url'] as String?,
      urlToImage: map['urlToImage'] as String?,
      publishedAt: map['publishedAt'] as String?,
      content: map['content'] as String?,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      source,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content
    ];
  }
}
