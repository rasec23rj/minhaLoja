import 'package:flutter/material.dart';
import 'package:minhaLoja/providers/orders.dart';
import 'package:minhaLoja/widgets/app_drawer.dart';
import 'package:minhaLoja/widgets/order_widget.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Orders orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (ctx, i) => OrderWidget(orders.items[i]),
      ),
    );
  }
}
