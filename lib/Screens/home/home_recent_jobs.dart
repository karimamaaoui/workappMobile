import 'package:flutter/material.dart';
import 'package:khedma/constants.dart';
import 'package:khedma/mock_data.dart';
import 'package:khedma/widgets/job_card.dart';

class HomeRecentJobs extends StatelessWidget {
  const HomeRecentJobs({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: recentJobs
            .asMap()
            .entries
            .map(
              (item) => Container(
                margin: EdgeInsets.symmetric(horizontal: kSpacingUnit * 3).copyWith(
                  top: item.key == 0 ? kSpacingUnit * 2 : 0,
                  bottom: kSpacingUnit * 2,
                ),
                child: JobCard(data: item.value),
              ),
            )
            .toList(),
      ),
    );
  }
}
