import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
  List<Map<String, dynamic>> articles = [];
  getData() async{
    var res = await dio.get('https://newsapi.org/v2/everything?q=tesla&from=2023-05-19&sortBy=publishedAt&apiKey=9622abfd10c24f958908a4fab62a7b2a');
    var data = await res.data;
    articles.addAll(data);
  }

  // var date = DateTime();

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Cocoa Farmers Newspaper',
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(height: 8,),
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
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
          ],
        ),
        body:  TabBarView(
          children: [
            // English tab content
            articles.isEmpty ? Container() : _buildChatList(articles),
            // Twi tab content
            const Placeholder(),
          ],
        ),
      ),
    );
  }

  Widget _buildChatList(List<Map<String, dynamic>> chats) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(chat['url']),
          ),
          title: Text(chat['title']),
          subtitle: Text(chat['author']),
          trailing: Text(DateFormat.yMMMMd("en_UK").format(chat['publishedAt'])),
          onTap: () {
            // Handle chat item tap
          },
        );
      },
    );
  }
}
