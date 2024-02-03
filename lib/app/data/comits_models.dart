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
}

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
}

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
}

class CommitAuthorClass {
  CommitAuthorClass({
    required this.name,
    required this.email,
    required this.date,
  });

  final String name;
  final String email;
  final DateTime date;
}

class Tree {
  Tree({
    required this.sha,
    required this.url,
  });

  final String sha;
  final String url;
}

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
}

class Parent {
  Parent({
    required this.sha,
    required this.url,
    required this.htmlUrl,
  });

  final String sha;
  final String url;
  final String htmlUrl;
}
