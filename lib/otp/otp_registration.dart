import 'package:click/otp/otp_page.dart';
import 'package:click/services/api_manager.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? _error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff7f6fb),
      appBar: AppBar(
        title: const Text('Профиль', style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 32),
          child: Column(
            children: [
              const SizedBox(
                height: 90,
              ),
              const Text(
                "Введите номер телефона, чтобы сохранить \nадрес доставки и историю заказов",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 28,
              ),
              Container(
                padding: EdgeInsets.all(28),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(12),
                // ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _controller,
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (String? value) {
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        prefixStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        prefixText: '+7 ',
                        suffixIcon: Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                        ),
                      ),
                    ),
                    if (_error != null) Text("error is $_error"),
                    const SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _controller.text.length == 10
                            ? () async {
                                ApiManager api = ApiManager();
                                var result =
                                    await api.sendCode(_controller.text);
                                if (result.isNotEmpty) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => Otp(
                                              phone: _controller.text,
                                            )),
                                  );
                                } else {
                                  setState(() {
                                    _error = result;
                                  });
                                  print('error');
                                }
                              }
                            : null,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) =>
                                states.contains(MaterialState.disabled)
                                    ? Colors.grey
                                    : Colors.yellow,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Далее',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Нажимая кнопку "Далее", вы принимаете условия \nПользовательского соглашения',
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
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
