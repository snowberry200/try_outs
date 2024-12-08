// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:try_outs/main.dart';

class ReturnContainer extends StatefulWidget {
  final SeatState seatState;
  final ValueSetter valueSetter;
  final int seat;
  final List selectedList;
  const ReturnContainer({
    super.key,
    required this.seatState,
    required this.valueSetter,
    required this.seat,
    required this.selectedList,
  });

  @override
  State<ReturnContainer> createState() => _ReturnContainerState();
}

class _ReturnContainerState extends State<ReturnContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          width: 20,
          height: 30,
          decoration: (BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            color: widget.selectedList.contains(widget.seat)
                ? Colors.orangeAccent
                : widget.seatState == SeatState.booked
                    ? const Color(0xff406B4A)
                    : Colors.teal,
          ))),
      onTap: () {
        if (widget.seatState == SeatState.booked) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            behavior: SnackBarBehavior.floating,
            elevation: 30,
            backgroundColor: CupertinoColors.destructiveRed,
            content: Text(
              'Already Booked! please choose a different seat...',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: CupertinoColors.white),
            ),
          ));
        } else {
          widget.valueSetter(widget.seat);
        }
      },
    );
  }
}
