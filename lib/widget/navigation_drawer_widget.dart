import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: _size.width * 0.15,
              padding: EdgeInsets.all(8.0),
              height: _size.width * 0.15,
              child: Image.asset(
                'assets/logos/logo_white.png',
              ),
            ),
            IconButton(
              icon: Icon(Icons.close),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Алматы',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Изменить',
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              leading: Icon(
                Icons.person,
                color: Colors.yellow,
              ),
            ),
            ListTile(
              title: const Text(
                'Войти',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                Icons.person_outline,
                color: Colors.yellow[500],
              ),
            ),
            ListTile(
              title: const Text(
                'Избранные',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                Icons.favorite_border_outlined,
                color: Colors.yellow[500],
              ),
            ),
            const Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: const Text(
                'Мои заказы',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                Icons.person_outline,
                color: Colors.transparent,
              ),
            ),
            ListTile(
              title: const Text(
                'Мои адреса',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                Icons.person_outline,
                color: Colors.transparent,
              ),
            ),
            ListTile(
              title: const Text(
                'Мои карты',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                Icons.person_outline,
                color: Colors.transparent,
              ),
            ),
            const Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: const Text(
                'О нас',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                Icons.person_outline,
                color: Colors.transparent,
              ),
            ),
            ListTile(
              title: const Text(
                'Контакты',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                Icons.person_outline,
                color: Colors.transparent,
              ),
            ),
            ListTile(
              title: const Text(
                'Франшиза',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                Icons.person_outline,
                color: Colors.transparent,
              ),
            ),
            ListTile(
              title: const Text(
                'Пользовательское соглашение',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                Icons.person_outline,
                color: Colors.transparent,
              ),
            ),
            const Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListTile(
                    title: Container(
                      child: Image.asset(
                        'assets/icons/google_play.png',
                      ),
                    ),
                    leading: Icon(
                      Icons.person_outline,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Container(
                      child: Image.asset(
                        'assets/icons/app_store.png',
                      ),
                    ),
                    trailing: Icon(
                      Icons.person_outline,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
