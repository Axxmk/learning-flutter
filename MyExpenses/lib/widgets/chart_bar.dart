import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraint) {
      return Column(
        children: [
          Container(
            height: constraint.maxHeight * 0.15,
            padding: EdgeInsets.only(bottom: 5),
            child: FittedBox(
              child: Text(
                "\$${spendingAmount.toStringAsFixed(0)}",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
          Container(
            height: constraint.maxHeight * 0.7,
            width: 14,
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(
                      color: Colors.grey[300],
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: constraint.maxHeight * 0.15,
            padding: EdgeInsets.only(top: 5),
            child: FittedBox(
              child: Text(
                label,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        ],
      );
    });
  }
}
