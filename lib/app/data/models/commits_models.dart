import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'commits_models.g.dart';

List<Commits> commitsFromJson(String str) =>
    List<Commits>.from(json.decode(str).map((x) => Commits.fromJson(x)));

String commitsToJson(List<Commits> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


@JsonSerializable(fieldRename: FieldRename.snake)
class Commits {
  Commits({
    required this.sha,
    required this.nodeId,
    required this.commit,
    required this.url,
    required this.htmlUrl,
    required this.commentsUrl,
    required this.author,
    required this.committer,
    required this.parents,
  });

  final String sha;
  final String nodeId;
  final Commit commit;
  final String url;
  final String htmlUrl;
  final String commentsUrl;
  final CommitAuthor author;
  final CommitAuthor committer;
  final List<Parent> parents;

  factory Commits.fromJson(Map<String, dynamic> json) => _$CommitsFromJson(json);
  Map<String, dynamic> toJson() => _$CommitsToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake)
class CommitAuthor {
  CommitAuthor({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String gravatarId;
  final String url;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String reposUrl;
  final String eventsUrl;
  final String receivedEventsUrl;
  final String type;
  final bool siteAdmin;

  factory CommitAuthor.fromJson(Map<String, dynamic> json) => _$CommitAuthorFromJson(json);
  Map<String, dynamic> toJson() => _$CommitAuthorToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake)
class Commit {
  Commit({
    required this.author,
    required this.committer,
    required this.message,
    required this.tree,
    required this.url,
    required this.commentCount,
    required this.verification,
  });

  final CommitAuthorClass author;
  final CommitAuthorClass committer;
  final String message;
  final Tree tree;
  final String url;
  final int commentCount;
  final Verification verification;

  factory Commit.fromJson(Map<String, dynamic> json) => _$CommitFromJson(json);
  Map<String, dynamic> toJson() => _$CommitToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake)
class CommitAuthorClass {
  CommitAuthorClass({
    required this.name,
    required this.email,
    required this.date,
  });

  final String name;
  final String email;
  final DateTime date;

  factory CommitAuthorClass.fromJson(Map<String, dynamic> json) => _$CommitAuthorClassFromJson(json);
  Map<String, dynamic> toJson() => _$CommitAuthorClassToJson(this);

  String get commitedAt {
    // difference between now and date
    final now = DateTime.now();
    final difference = now.difference(date);
    if (difference.inDays > 0) {
      return 'commited ${difference.inDays} days ago';
    }
    if (difference.inHours > 0) {
      return 'commited ${difference.inHours} hours ago';
    }
    if (difference.inMinutes > 0) {
      return 'commited ${difference.inMinutes} minutes ago';
    }
    if (difference.inSeconds > 0) {
      return 'commited ${difference.inSeconds} seconds ago';
    }
    return 'commited ${difference.inDays}';
  }
}
@JsonSerializable(fieldRename: FieldRename.snake)
class Tree {
  Tree({
    required this.sha,
    required this.url,
  });

  final String sha;
  final String url;

  factory Tree.fromJson(Map<String, dynamic> json) => _$TreeFromJson(json);
  Map<String, dynamic> toJson() => _$TreeToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake)
class Verification {
  Verification({
    required this.verified,
    required this.reason,
    required this.signature,
    required this.payload,
  });

  final bool verified;
  final String reason;
  final dynamic signature;
  final dynamic payload;

  factory Verification.fromJson(Map<String, dynamic> json) => _$VerificationFromJson(json);
}
@JsonSerializable(fieldRename: FieldRename.snake)
class Parent {
  Parent({
    required this.sha,
    required this.url,
    required this.htmlUrl,
  });

  final String sha;
  final String url;
  final String htmlUrl;

  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);
  Map<String, dynamic> toJson() => _$ParentToJson(this);
}
