import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_shop/bloc/orders_bloc.dart';
import 'package:plant_shop/screens/orders/widgets/order_cards.dart';
import 'package:plant_shop/shared/empty-view.dart';
import 'package:plant_shop/shared/size_config.dart';

class OrdersScreen extends StatelessWidget {
  OrderBloc get orderBloc => BlocProvider.getBloc<OrderBloc>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    orderBloc.getOrders();
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(
          'Pedidos',
          style: TextStyle(color: Colors.grey[850]),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsets.only(top: 8),
          child: MaterialButton(
              padding: EdgeInsets.all(1),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              child: SvgPicture.asset(
                'images/menu.svg',
                color: Colors.grey[600],
                width: 28,
                height: 28,
              )),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        width: SizeConfig.safeBlockHorizontal * 100,
        height: SizeConfig.safeBlockVertical * 89,
        child: StreamBuilder(
            stream: orderBloc.orderList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.length > 0) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return OrderCards(
                        id: snapshot.data[index].id,
                        date: snapshot.data[index].date,
                        status: snapshot.data[index].status,
                        totalValue: snapshot.data[index].price,
                        products: snapshot.data[index].products,
                      );
                    },
                    itemCount: snapshot.data.length,
                  );
                } else {
                  return EmptyView(
                  msg:
                      'Você não realizou nenhum pedido...ainda.',
                );
                }
              } else {
                return Center(
                  child: SizedBox(
                      width: SizeConfig.safeBlockHorizontal * 30,
                      height: SizeConfig.safeBlockHorizontal * 30,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                      )),
                );
              }
            }),
      ),
    );
  }
}
