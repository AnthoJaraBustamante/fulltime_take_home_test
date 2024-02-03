// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commits_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commits _$CommitsFromJson(Map<String, dynamic> json) => Commits(
      sha: json['sha'] as String,
      nodeId: json['node_id'] as String,
      commit: Commit.fromJson(json['commit'] as Map<String, dynamic>),
      url: json['url'] as String,
      htmlUrl: json['html_url'] as String,
      commentsUrl: json['comments_url'] as String,
      author: CommitAuthor.fromJson(json['author'] as Map<String, dynamic>),
      committer:
          CommitAuthor.fromJson(json['committer'] as Map<String, dynamic>),
      parents: (json['parents'] as List<dynamic>)
          .map((e) => Parent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommitsToJson(Commits instance) => <String, dynamic>{
      'sha': instance.sha,
      'node_id': instance.nodeId,
      'commit': instance.commit,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'comments_url': instance.commentsUrl,
      'author': instance.author,
      'committer': instance.committer,
      'parents': instance.parents,
    };

CommitAuthor _$CommitAuthorFromJson(Map<String, dynamic> json) => CommitAuthor(
      login: json['login'] as String,
      id: json['id'] as int,
      nodeId: json['node_id'] as String,
      avatarUrl: json['avatar_url'] as String,
      gravatarId: json['gravatar_id'] as String,
      url: json['url'] as String,
      htmlUrl: json['html_url'] as String,
      followersUrl: json['followers_url'] as String,
      followingUrl: json['following_url'] as String,
      gistsUrl: json['gists_url'] as String,
      starredUrl: json['starred_url'] as String,
      subscriptionsUrl: json['subscriptions_url'] as String,
      organizationsUrl: json['organizations_url'] as String,
      reposUrl: json['repos_url'] as String,
      eventsUrl: json['events_url'] as String,
      receivedEventsUrl: json['received_events_url'] as String,
      type: json['type'] as String,
      siteAdmin: json['site_admin'] as bool,
    );

Map<String, dynamic> _$CommitAuthorToJson(CommitAuthor instance) =>
    <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'node_id': instance.nodeId,
      'avatar_url': instance.avatarUrl,
      'gravatar_id': instance.gravatarId,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'followers_url': instance.followersUrl,
      'following_url': instance.followingUrl,
      'gists_url': instance.gistsUrl,
      'starred_url': instance.starredUrl,
      'subscriptions_url': instance.subscriptionsUrl,
      'organizations_url': instance.organizationsUrl,
      'repos_url': instance.reposUrl,
      'events_url': instance.eventsUrl,
      'received_events_url': instance.receivedEventsUrl,
      'type': instance.type,
      'site_admin': instance.siteAdmin,
    };

Commit _$CommitFromJson(Map<String, dynamic> json) => Commit(
      author:
          CommitAuthorClass.fromJson(json['author'] as Map<String, dynamic>),
      committer:
          CommitAuthorClass.fromJson(json['committer'] as Map<String, dynamic>),
      message: json['message'] as String,
      tree: Tree.fromJson(json['tree'] as Map<String, dynamic>),
      url: json['url'] as String,
      commentCount: json['comment_count'] as int,
      verification:
          Verification.fromJson(json['verification'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommitToJson(Commit instance) => <String, dynamic>{
      'author': instance.author,
      'committer': instance.committer,
      'message': instance.message,
      'tree': instance.tree,
      'url': instance.url,
      'comment_count': instance.commentCount,
      'verification': instance.verification,
    };

CommitAuthorClass _$CommitAuthorClassFromJson(Map<String, dynamic> json) =>
    CommitAuthorClass(
      name: json['name'] as String,
      email: json['email'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$CommitAuthorClassToJson(CommitAuthorClass instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'date': instance.date.toIso8601String(),
    };

Tree _$TreeFromJson(Map<String, dynamic> json) => Tree(
      sha: json['sha'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$TreeToJson(Tree instance) => <String, dynamic>{
      'sha': instance.sha,
      'url': instance.url,
    };

Verification _$VerificationFromJson(Map<String, dynamic> json) => Verification(
      verified: json['verified'] as bool,
      reason: json['reason'] as String,
      signature: json['signature'],
      payload: json['payload'],
    );

Map<String, dynamic> _$VerificationToJson(Verification instance) =>
    <String, dynamic>{
      'verified': instance.verified,
      'reason': instance.reason,
      'signature': instance.signature,
      'payload': instance.payload,
    };

Parent _$ParentFromJson(Map<String, dynamic> json) => Parent(
      sha: json['sha'] as String,
      url: json['url'] as String,
      htmlUrl: json['html_url'] as String,
    );

Map<String, dynamic> _$ParentToJson(Parent instance) => <String, dynamic>{
      'sha': instance.sha,
      'url': instance.url,
      'html_url': instance.htmlUrl,
    };
