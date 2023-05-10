import 'package:flutter/material.dart';

class BalanceSection extends StatefulWidget {
  const BalanceSection({super.key});

  @override
  State<BalanceSection> createState() => _BalanceSectionState();
}

class _BalanceSectionState extends State<BalanceSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 223, 223, 223),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            const Icon(Icons.monetization_on, color: Colors.amber),
            VerticalDivider(width: 10),
            Column(
              children: [
                const Text('Balance',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Text('Rp 5,000,000.00')
              ],
            ),
            Spacer(),
            const Icon(Icons.credit_card, color: Colors.amber),
            VerticalDivider(width: 10),
            Column(
              children: [
                const Text('Voucher',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('3 Available')
              ],
            ),
          ],
        ));
  }
}
