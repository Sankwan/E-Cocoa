import 'package:dio/dio.dart';
import 'package:ecocoa/screens/article_page.dart';
import 'package:ecocoa/screens/authentication/login_page.dart';
import 'package:ecocoa/widgets/custom_list_tile.dart';
import 'package:ecocoa/widgets/pagesnavigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dio = Dio();
  List<Map<String, dynamic>> englishChats = [
    {
      'avatar': 'assets/avatar1.png',
      'title': 'John Doe',
      'subtitle': 'Hello, how are you?',
      'time': '9:30 AM',
    },
    {
      'avatar': 'assets/avatar2.png',
      'title': 'Jane Smith',
      'subtitle': 'Good morning!',
      'time': 'Yesterday',
    },
    // Add more chat data here
  ];
  List articles = [];
  getData() async {
    var res = await dio.get(
        'https://newsapi.org/v2/everything?q=ghana&from=2023-05-19&sortBy=publishedAt&pageSize=20&apiKey=9622abfd10c24f958908a4fab62a7b2a');
    var data = await res.data;
    articles = data['articles'];
    setState(() {});
  }

  // var date = DateTime();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      getData();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cocoa Farmers Newspaper',
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Issues',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'English'),
              Tab(text: 'Twi'),
            ],
          ),
          toolbarHeight: 80,
          elevation: 0,
          actions: [
            PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text('Logout'),
          value: 'logout',
        ),
      ],
      onSelected: (value) {
        if (value == 'logout') {
          nextNavRemoveHistory(context, LoginPage());
        }
      },
      icon: Icon(Icons.more_vert),
    ),
          ],
        ),
        body: TabBarView(
          children: [
            // English tab content
            articles.isEmpty ? Container() : _buildChatList(articles),
            // Twi tab content
            ListView(
      children: [
        CustomListTile(
          image: 'assets/images/avatar1.jpeg',
          title: 'Onua Kaseɛbɔ nnie',
          subtitle: 'Ɛnyɛ Nana Kwame ɔkɛseɛ bi aa wanya natamfo...',
          date: '2022-12-19',
        ),
        CustomListTile(
          image: 'assets/images/avatar2.jpeg',
          title: 'Daakye Nhyehyemu',
          subtitle: 'Enuanom ne ad)fo), sɛ yasan ahyia biom a, na ɛyɛ Nyame adom...',
          date: '2022-12-18',
        ),
        CustomListTile(
          image: 'assets/images/avatar3.jpeg',
          title: 'Ama Ntow Amanieɛ: The Mirror',
          subtitle: ')baasima Ama Ntow na amanihunu bi ato no. ɛnne sɛ,...',
          date: '2023-03-7',
        ),
        CustomListTile(
          image: 'assets/images/avatar4.jpeg',
          title: 'OnuaD) Na ɛyɛ',
          subtitle: 'Sɛ wohwɛ na sɛ wonni nnua d), ɛmmɛdi yɛkyi o,... ',
          date: '2023-06-6',
        ),
        CustomListTile(
          image: 'assets/images/avatar5.jpeg',
          title: 'Agoprama ho nkaseɛb):',
          subtitle: 'Mohammed Kudus na ewiase fo) nyinaa ɛkamfo no sɛ wasan ama animuonyam ahyerɛn w) Ghana so...',
          date: '2023-06-21',
        ),
      ],
    ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatList(List chats) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        final publishedAt = DateTime.parse(chat['publishedAt']);
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(chat['urlToImage']),
          ),
          title:
              Text(chat['title'], maxLines: 2, overflow: TextOverflow.ellipsis),
          subtitle: Text(chat['author'] ?? "Anonymous",
              maxLines: 1, overflow: TextOverflow.ellipsis),
          trailing: Text(DateFormat.yMMMMd("en_US").format(publishedAt)),
          onTap: () {
            // Handle chat item tap
            nextNav(
                context,
                ArticlePage(
                    author: chat['author'] ?? "Anonymous",
                    content: chat['content'],
                    imageUrl: chat['urlToImage'],
                    date: DateFormat.yMMMMd("en_US").format(publishedAt),
                    description: chat['description'],
                    title: chat['title'],
                  ),
                );
          },
        );
      },
    );
  }
}
