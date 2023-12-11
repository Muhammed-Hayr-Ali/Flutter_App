import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  final Dio dio = Dio();

  final Options? options = Options(contentType: 'application/json');
  final ScrollController _scrollController = ScrollController();

  List posts = [];
  int index = 1;
  bool hasMore = false;
  bool isLoading = false;

  fetchData() async {
    // final response = await _dio
    //     .get('${AppConstants.serverUrl}/post/?page=$index', options: options);

    // if (response.statusCode == 200) {
    //   final data =
    //       (response.data['data'] as List).map((e) => Post.fromJson(e)).toList();
    //   hasMore = response.data['next_page_url'] != null ? true : false;
    //   setState(() {
    //     posts.addAll(data);
    //   });
    // }
  }

  void scrollindecator() async {
    _scrollController.addListener(
      () async {
        if (_scrollController.offset >=
                _scrollController.position.maxScrollExtent &&
            hasMore) {
          setState(() {
            isLoading = true;
          });
          index++;
          await fetchData();
          setState(() {
            isLoading = false;
          });
        }
      },
    );
  }

  @override
  void initState() {
    fetchData();
    scrollindecator();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: isLoading ? posts.length + 1 : posts.length,
      itemBuilder: (context, index) {
        if (index >= posts.length) {
          return const Center(
            child: CustomProgress(),
          );
        } else {
          final post = posts[index];

          return Card(
            child: ListTile(
              title: Text(post.author!.name ?? ''),
              subtitle: Text(post.description ?? ''),
            ),
          );
        }
      },
    );
  }
}
