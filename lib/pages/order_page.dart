import 'package:flutter/material.dart';
import 'order.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final List<Order> orders = [];
  final TextEditingController _cryptoController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  void _addOrder() {
    final String crypto = _cryptoController.text;
    final double? amount = double.tryParse(_amountController.text);

    if (crypto.isNotEmpty && amount != null) {
      setState(() {
        orders.add(Order(crypto: crypto, amount: amount));
        _cryptoController.clear();
        _amountController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _cryptoController,
                    decoration: const InputDecoration(
                      labelText: 'Cryptocurrency',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addOrder,
                  child: const Text('Add Order'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(orders[index].crypto),
                    subtitle: Text('Amount: ${orders[index].amount}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}