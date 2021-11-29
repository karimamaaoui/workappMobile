import 'package:flutter/material.dart';
import 'package:khedma/constants.dart';
import 'package:khedma/model/job.dart';
import 'package:khedma/screens/detail/detail_content.dart';
import 'package:khedma/screens/detail/detail_footer.dart';
import 'package:khedma/screens/detail/detail_header.dart';

class DetailScreen extends StatelessWidget {
  final Job data;

  const DetailScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSilverColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                DetailHeader(data: data),
                DetailContent(data: data),
              ],
            ),
            DetailFooter(),
          ],
        ),
      ),
    );
  }
}
