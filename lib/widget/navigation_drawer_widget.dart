import 'package:click/main.dart';
import 'package:flutter/material.dart';
import 'package:click/widget/navigation_drawer_widget.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        width: _size.width,
        child: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/logos/logo.svg'),
              Container(
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ListTile(
                      title: Text(
                        'Алматы',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                      subtitle: Text(
                        'Изменить',
                        style: TextStyle(
                            fontWeight: FontWeight.w200, color: Colors.white),
                      ),
                      leading: Icon(
                        Icons.person,
                        color: Colors.yellow,
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Войти',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                      leading: Icon(
                        Icons.contact_phone,
                        color: Colors.yellow[500],
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        'Избранные',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                      leading: Icon(
                        Icons.favorite,
                        color: Colors.yellow[500],
                      ),
                    ),
                    const Divider(),
                    const ListTile(
                      title: Text(
                        'Мои заказы',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      title: Text(
                        'Мои адреса',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      title: Text(
                        'Мои карты',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                    const Divider(),
                    const ListTile(
                      title: Text(
                        'О нас',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      title: Text(
                        'Контакты',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      title: Text(
                        'Франшиза',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
