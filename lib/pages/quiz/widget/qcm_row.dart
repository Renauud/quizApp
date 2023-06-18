import 'package:flutter/material.dart';

//inutile pr l'instant!
class QCMRow extends StatefulWidget {
  const QCMRow({
    Key? key,
    required this.prop,
  }) : super(key: key);

  final String prop;

  @override
  State<QCMRow> createState() => _QCMRowState();
}

class _QCMRowState extends State<QCMRow> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: InkWell(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(widget.prop),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
