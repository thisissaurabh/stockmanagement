import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spyco_shop_management/constants/colors.dart';

class MainRecentFiles extends StatelessWidget {
  final String mainTitle;
  final String mainRowTitle1;
  final String mainRowTitle2;
  final String mainRowTitle3;
  final List<DataRow> rows;

  const MainRecentFiles({
    Key? key,
    required this.mainTitle,
    required this.mainRowTitle1,
    required this.mainRowTitle2,
    required this.mainRowTitle3,
    required this.rows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mainTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
                columnSpacing: defaultPadding,
                // minWidth: 600,
                columns: [
                  DataColumn(
                    label: Text(mainRowTitle1),
                  ),
                  DataColumn(
                    label: Text(mainRowTitle2),
                  ),
                  DataColumn(
                    label: Text(mainRowTitle3),
                  ),
                ],
                rows: rows),
          ),
        ],
      ),
    );
  }
}

DataRow mainRecentFileDataRow(MainRecentFileRequires fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo.icon!,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.title!),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.size!)),
    ],
  );
}

class MainRecentFileRequires {
  final String? icon, title, date, size;

  MainRecentFileRequires({this.icon, this.title, this.date, this.size});
}
