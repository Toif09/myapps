import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var faker = new Faker();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Extraxt Widget"),
        ),
        body: ListView.separated(
          itemCount: 100,
          itemBuilder: (context, index) {
            return chatItem(
              imageUrl: 'https://picsum.photos/id/$index/200/300',
              title: faker.person.name(),
              subtitle: faker.lorem.sentence(),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 10,
              color: Colors.black12,
            );
          },
        ),
      ),
    );
  }
}

class chatItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  chatItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text("10:00PM"),
    );
  }
}
