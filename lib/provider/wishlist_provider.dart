import 'package:ecommerce/models/favorite_item.dart';
import 'package:flutter/material.dart';

class WishListProvider with ChangeNotifier {
  Map<String, FavoriteItem> _favoriteItems = {};

  Map<String, FavoriteItem> get getAllFavoriteItems => {..._favoriteItems};

  void addAndRemoveToWishList(
      String id, String title, double price, String imageSrc) {
    if (_favoriteItems.containsKey(id)) {
      removeItem(
        id: id,
      );
    } else {
      _favoriteItems.putIfAbsent(
        id,
        () => FavoriteItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          imageSrc: imageSrc,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem({required String id}) {
    _favoriteItems.remove(id);
    notifyListeners();
  }

  void clearWishList() {
    _favoriteItems.clear();
    notifyListeners();
  }
}
