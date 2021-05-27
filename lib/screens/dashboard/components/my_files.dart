import 'package:flutter/material.dart';
import 'package:responsive_admin_panel/models/MyFiles.dart';
import 'package:responsive_admin_panel/responsive.dart';
import 'package:responsive_admin_panel/screens/dashboard/components/file_info_card.dart';

import '../../../constants.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Files",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                horizontal: defaultPadding * 1.5,
                vertical:
                    defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
              )),
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Add New"),
            ),
          ],
        ),
        SizedBox(
          height: defaultPadding,
        ),
        Responsive(
            mobile: FileInfoCardView(
                crossAxisCount: _size.width < 650 ? 2 : 4,
                childAspectRatio: _size.width < 650 ? 1.3 : 1),
            tablet: FileInfoCardView(),
            desktop: FileInfoCardView(
              childAspectRatio: _size.width < 1000 ? 1.1 : 1.4,
            ))
      ],
    );
  }
}

class FileInfoCardView extends StatelessWidget {
  const FileInfoCardView(
      {Key key, this.crossAxisCount = 4, this.childAspectRatio = 1})
      : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: demoMyFields.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
            childAspectRatio: childAspectRatio),
        itemBuilder: (context, index) => FileInfoCard(
              info: demoMyFields[index],
            ));
  }
}
