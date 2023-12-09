
import 'package:flutter/material.dart';
import 'package:spyco_shop_management/constants/colors.dart';

class RelationShipCheckBox extends StatefulWidget {
  final String relation;
  final Function(String) onPop;
  const RelationShipCheckBox(
      {Key? key, required this.relation, required this.onPop})
      : super(key: key);

  @override
  State<RelationShipCheckBox> createState() => _RelationShipCheckBoxState();
}

class _RelationShipCheckBoxState extends State<RelationShipCheckBox> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _gIndex = 0;
              Navigator.of(context).pop();
              widget.onPop("Bussiness");
            });
          },
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _gIndex = 0;
                    // Navigator.of(context).pop();
                    widget.onPop("Bussiness");
                  });
                },
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _gIndex == 0
                            ? bgColor
                            : Colors.transparent,
                        shape: BoxShape.circle,

                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text('Bussiness', )
            ],
          ),
        ),
        SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            setState(() {
              _gIndex = 1;
              Navigator.of(context).pop();
              widget.onPop("Individual");
            });
          },
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _gIndex = 1;
                    // Navigator.of(context).pop();
                    widget.onPop("Individual");
                  });
                },
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _gIndex == 1
                            ? bgColor
                            : Colors.transparent,
                        shape: BoxShape.circle,

                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text('Individual',)
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  void initState() {
    if (widget.relation == "Bussiness") {
      _gIndex = 0;
    } else if (widget.relation == "Individual") {
      _gIndex = 1;
    }
    super.initState();
  }
}
