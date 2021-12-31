import 'package:flutter/material.dart';
import 'package:majootestcase/models/movie_response.dart';

class HomeBlocLoadedScreen extends StatelessWidget {
  final List<Data> data;

  const HomeBlocLoadedScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return movieItemWidget(data[index]);
        },
      ),
    );
  }

  Widget movieItemWidget(Data data) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0))),
      child: Column(
        children: [
          if (data.i?.imageUrl != null)
            Padding(
              padding: EdgeInsets.all(25),
              child: Image.network(data.i!.imageUrl!),
            ),
          if (data.l != null)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Text(data.l!, textDirection: TextDirection.ltr),
            )
        ],
      ),
    );
  }
}
