import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fulltime_take_home_test/app/data/network/consts.dart';
import 'package:fulltime_take_home_test/blocs/commits/commits_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CommitsPage extends StatefulWidget {
  const CommitsPage({super.key});

  @override
  State<CommitsPage> createState() => _CommitsPageState();
}

class _CommitsPageState extends State<CommitsPage> {
  @override
  void initState() {
    super.initState();
    context.read<CommitsBloc>().add(const FetchCommits());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CommitsBloc, CommitsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.commits.isEmpty) {
            return const Center(
              child: Text('No commits yet'),
            );
          }
          return Column(
            children: [
              const SafeArea(child: SizedBox(height: 20)),
              Wrap(
                children: [
                  const Icon(Icons.book_outlined, size: 18),
                  DefaultTextStyle(
                    style: GoogleFonts.blinker(
                      color: const Color(0xff58a6ff),
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          _buildUrlText(
                            Const.user,
                            'https://github.com/${Const.user}',
                          ),
                          const TextSpan(
                            text: ' / ',
                            style: TextStyle(color: Colors.white),
                          ),
                          _buildUrlText(
                            Const.repo,
                            'https://github.com/${Const.user}/${Const.repo}',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.commits.length,
                  itemBuilder: (context, index) {
                    final commit = state.commits[index];
                    return ListTile(
                      leading: const Icon(Icons.commit_outlined),
                      title: Row(
                        children: [
                          Text(commit.commit.message),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundImage: NetworkImage(commit.author.avatarUrl),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(commit.commit.author.name),
                              const Spacer(),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Clipboard.setData(ClipboardData(text: commit.sha));
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text("Full SHA copied to clipboard"),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.white.withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                      child: const Icon(Icons.copy_outlined, size: 15),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => launchUrl(Uri.parse(commit.htmlUrl)),
                                    child: Container(
                                      constraints: const BoxConstraints(minWidth: 70),
                                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                      child: Text(
                                        commit.sha.substring(0, 7),
                                        style: GoogleFonts.blinker(
                                          color: const Color(0xff58a6ff),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      launchUrl(Uri.parse(commit.commit.tree.url));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.5),
                                          // width: 0.7,
                                        ),
                                      ),
                                      child: const Icon(Icons.code, size: 15),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Text(
                            commit.commit.author.commitedAt,
                            style: GoogleFonts.blinker(
                              color: const Color(0xff8b949e),
                              // fontWeight: FontWeight.w2300,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                      horizontalTitleGap: 2,
                      dense: true,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  WidgetSpan _buildUrlText(
    String text,
    String url,
  ) {
    return WidgetSpan(
      child: InkWell(
        onTap: () {
          launchUrlString(url);
        },
        child: Text(
          text,
        ),
      ),
    );
  }
}
