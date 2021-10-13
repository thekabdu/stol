import 'package:click/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const showCard = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melt',
      theme: ThemeData(primaryColor: Colors.white),
      home: HomePage(),
    );
  }
}

class _BannerPageViewModel {
  final String imagePath;

  _BannerPageViewModel({
    required this.imagePath,
  });
}

class _FoodCategoryPageViewModel {
  final String title;

  _FoodCategoryPageViewModel({
    required this.title,
  });
}

class _FoodPageViewModel {
  final String title;
  final String image;
  final String description;
  final bool isFixedAmount;
  final bool isNew;
  final int price;

  _FoodPageViewModel({
    required this.title,
    required this.image,
    required this.description,
    this.isFixedAmount = true,
    this.isNew = false,
    required this.price,
  });
}

class HomePage extends StatelessWidget {
  final List<_BannerPageViewModel> _pages = [
    _BannerPageViewModel(
      imagePath: 'assets/images/banner_1.png',
    ),
    _BannerPageViewModel(
      imagePath: 'assets/images/banner_2.png',
    ),
  ];
  final List<_FoodCategoryPageViewModel> _foodCategory = [
    _FoodCategoryPageViewModel(
      title: 'Пицца',
    ),
    _FoodCategoryPageViewModel(
      title: 'Напитки',
    ),
    _FoodCategoryPageViewModel(
      title: 'Закуски',
    ),
    _FoodCategoryPageViewModel(
      title: 'Десерты',
    ),
  ];
  final List<_FoodPageViewModel> _foods = [
    _FoodPageViewModel(
      title: 'Маргарита',
      price: 1390,
      image: 'food_3.png',
      description: 'Тесто, сыр моццарелла, помидоры, соус мутти',
      isFixedAmount: false,
      isNew: true,
    ),
    _FoodPageViewModel(
      title: 'Спагетти Болоньезе 🌱',
      price: 1490,
      image: 'food_2.png',
      description:
          'Соус мутти, моль, перец, паста, растительное масло, пармезан, сахар, базилик',
    ),
    _FoodPageViewModel(
      title: 'Сытная чиабатта',
      price: 1190,
      image: 'food_1.png',
      description:
          'Тесто, соус мутти, говяжья ветчина, помидор, моцарелла, лист салата',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: _size.width * 0.15,
              padding: EdgeInsets.all(8.0),
              height: _size.width * 0.15,
              child: Image.asset(
                'assets/logos/logo.png',
              ),
            ),
            Expanded(
              child: TextField(
                onChanged: (value) => print(value),
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                  hintText: "Search product",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: NavigationDrawerWidget(),
      body: Column(
        children: [
          Container(
            height: _size.height * 0.2,
            child: PageView.builder(
              itemCount: _pages.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      _pages[index].imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: _size.height * 0.05,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _foodCategory.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  child: Container(
                    width: _size.width * 0.25,
                    height: _size.width * 0.05,
                    decoration: BoxDecoration(
                      color: index == 0 ? Colors.yellow[600] : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "${_foodCategory[index].title}",
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: const [
              SizedBox(
                width: 8.0,
              ),
              Text(
                'Бестселлеры',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: _foods.length,
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                );
              },
              itemBuilder: (BuildContext context, int index) {
                var _food = _foods[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: _size.width * 0.30,
                    decoration: BoxDecoration(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/${_food.image}',
                              ),
                              if (_food.isNew)
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      'NEW',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${_food.title}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        _food.isNew
                                            ? Icons.favorite
                                            : Icons.favorite_border_outlined,
                                        color: _food.isNew
                                            ? Colors.red[500]
                                            : Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 16.0,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Expanded(
                                child: Text(
                                  "${_food.description}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                "${_food.isFixedAmount ? '' : 'от '}${_food.price} TГ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
