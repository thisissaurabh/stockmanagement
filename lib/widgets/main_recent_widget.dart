import 'package:flutter/material.dart';

import 'package:spyco_shop_management/constants/colors.dart';

class MainRecentWidget extends StatefulWidget {
  final int lenght;
  final String title;
  final String dataColumn1name;
  final String dataColumn2name;
  final String dataColumn3name;
  final String dataColumn4name;

  final String dataCell1Item;
  final String dataCell2Item;
  final String dataCell3Item;
  final String dataCell4Item;

  const MainRecentWidget(
      {super.key,
      required this.title,
      required this.dataColumn1name,
      required this.dataColumn2name,
      required this.dataColumn3name,
      required this.dataColumn4name,
      required this.lenght,
      required this.dataCell1Item,
      required this.dataCell2Item,
      required this.dataCell3Item,
      required this.dataCell4Item});

  @override
  State<MainRecentWidget> createState() => _MainRecentWidgetState();
}

class _MainRecentWidgetState extends State<MainRecentWidget> {
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
            widget.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              // minWidth: 600,
              columns: [
                DataColumn(
                  label: Text(widget.dataColumn1name),
                ),
                DataColumn(
                  label: Text(widget.dataColumn2name),
                ),
                DataColumn(
                  label: Text(widget.dataColumn3name),
                ),
                DataColumn(
                  label: Text(widget.dataColumn4name),
                ),
              ],
              rows: List.generate(
                widget.lenght,
                (index) => DataRow(
                  cells: [
                    DataCell(
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            child: Text(widget.dataCell1Item),
                          ),
                        ],
                      ),
                    ),
                    DataCell(Text(widget.dataCell2Item)),
                    DataCell(Text(widget.dataCell3Item)),
                    DataCell(Text(widget.dataCell4Item)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
