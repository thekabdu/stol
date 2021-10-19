import 'package:click/otp/otp_registration.dart';
import 'package:flutter/material.dart';

class _FoodInforamtionPageViewModel {
  final String title;
  final int amount;

  _FoodInforamtionPageViewModel({
    required this.title,
    required this.amount,
  });
}

final List<_FoodInforamtionPageViewModel> _foodInformation = [
  _FoodInforamtionPageViewModel(
    title: 'Калории',
    amount: 410,
  ),
  _FoodInforamtionPageViewModel(
    title: 'Белки',
    amount: 5,
  ),
  _FoodInforamtionPageViewModel(
    title: 'Жиры',
    amount: 22,
  ),
  _FoodInforamtionPageViewModel(
    title: 'Углеводы',
    amount: 47,
  ),
];

class FoodDetail extends StatelessWidget {
  static const showCard = true;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: _size.width * 0.80,
              padding: const EdgeInsets.all(8.0),
              height: _size.width * 0.80,
              child: Image.asset(
                'assets/images/detail_food.png',
              ),
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Маффин Три шоколада \nNew York',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.favorite_outline),
                color: Colors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                // onPressed: () {
                //   Navigator.pop(context);
                // },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('1 шт'),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 7.0),
            child: Text(
              'Десерт из натурального какао, нежной начинки на основе шоколада и кубиков белого и молочного шоколада',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: _size.height * 0.07,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _foodInformation.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 2.0,
                  ),
                  child: Container(
                    width: _size.width * 0.20,
                    height: _size.width * 0.30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${_foodInformation[index].title}",
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          "${_foodInformation[index].amount}",
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch(
                value: true,
                onChanged: (var a) {},
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const SizedBox(
            height: 16,
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 8.0),
          // ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: _size.width * 0.30,
                height: _size.width * 0.10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.yellow.shade400,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "В корзину",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 62,
              ),
              Row(
                children: [
                  const Text(
                    '1490₸',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: '1700',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        decorationStyle: TextDecorationStyle.dashed,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
