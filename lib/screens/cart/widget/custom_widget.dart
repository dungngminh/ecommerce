import 'package:flutter/material.dart';

Widget checkoutSection(BuildContext context) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 35),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Material(
              borderRadius: BorderRadius.circular(30),
              color: Colors.red,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Checkout',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  'Total: ',
                  style: TextStyle(
                    color: Theme.of(context).textSelectionTheme.selectionColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$450',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).textSelectionTheme.selectionColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
