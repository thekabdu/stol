import 'package:click/main.dart';
import 'package:click/services/api_manager.dart';
import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  final String phone;

  const Otp({Key? key, required this.phone}) : super(key: key);
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('SMS-код', style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              const SizedBox(
                height: 90,
              ),
              const Text(
                'Код отправили сообщением на',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                "+7 ${widget.phone}",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 28,
              ),
              TextFormField(
                controller: _controller,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.cancel_rounded,
                    color: Colors.red,
                    size: 20,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          ApiManager api = ApiManager();
                          var result = await api.authenticate(
                              widget.phone, _controller.text);
                          if (result.isNotEmpty) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          } else {
                            print('error ');
                          }
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.grey),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey.shade200),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(right: 20, left: 20),
                          child: Text(
                            'Получить новый код',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Если код не придет,\nможно получить новый через 59 сек",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
