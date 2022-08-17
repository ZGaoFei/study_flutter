import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter/provider/test_provider/model/collection_list_model.dart';
import 'package:study_flutter/provider/test_provider/model/list_model.dart';
import 'package:study_flutter/provider/test_provider/model/shop_model.dart';

class ChangeNotificationProxyProviderWidget extends StatefulWidget {
  const ChangeNotificationProxyProviderWidget({Key? key}) : super(key: key);

  @override
  State<ChangeNotificationProxyProviderWidget> createState() =>
      _ChangeNotificationProxyProviderWidgetState();
}

class _ChangeNotificationProxyProviderWidgetState
    extends State<ChangeNotificationProxyProviderWidget> {
  int _selectedIndex = 0;
  final _pages = [const ListPage(), const CollectionPage()];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<ListModel>(
            create: (ctx) => ListModel(),
          ),
          ChangeNotifierProxyProvider<ListModel, CollectionListModel>(
            create: (ctx) => CollectionListModel(ListModel()),
            update: (ctx, listModel, collectionModel) {
              print("zgf ====update==== ${listModel.shops.length}");
              return CollectionListModel(listModel);
            },
          )
        ],
        child: Scaffold(
          body: _pages[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt_outlined), label: "商品列表"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "收藏列表")
            ],
          ),
        ));
  }
}

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListModel listModel = Provider.of<ListModel>(context);
    List<ShopModel> shops = listModel.shops;
    return Scaffold(
      appBar: AppBar(
        title: const Text("商品列表"),
      ),
      body: ListView.builder(
        itemCount: listModel.shops.length,
        itemBuilder: (ctx, index) => ShopItem(
          shop: shops[index],
        ),
      ),
    );
  }
}

class CollectionPage extends StatelessWidget {
  const CollectionPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CollectionListModel collectionModel =
        Provider.of<CollectionListModel>(context);
    List<ShopModel> shops = collectionModel.shops;
    return Scaffold(
      appBar: AppBar(
        title: const Text("收藏列表"),
      ),
      body: ListView.builder(
        itemCount: shops.length,
        itemBuilder: (ctx, index) => ShopItem(
          shop: shops[index],
        ),
      ),
    );
  }
}

class ShopItem extends StatelessWidget {
  const ShopItem({Key? key, required this.shop}) : super(key: key);
  final ShopModel shop;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text("${shop.id}"),
      ),
      title: Text(
        shop.name,
        style: const TextStyle(fontSize: 17),
      ),
      trailing: ShopCollectionButton(
        shop: shop,
      ),
    );
  }
}

class ShopCollectionButton extends StatelessWidget {
  const ShopCollectionButton({Key? key, required this.shop}) : super(key: key);
  final ShopModel shop;
  @override
  Widget build(BuildContext context) {
    CollectionListModel collectionModel =
        Provider.of<CollectionListModel>(context);
    bool contains = collectionModel.shops.contains(shop);
    return InkWell(
      onTap: contains
          ? () => collectionModel.remove(shop)
          : () => collectionModel.add(shop),
      child: SizedBox(
        width: 60,
        height: 60,
        child: contains
            ? const Icon(
                Icons.favorite,
                color: Colors.redAccent,
              )
            : const Icon(Icons.favorite_border),
      ),
    );
  }
}
