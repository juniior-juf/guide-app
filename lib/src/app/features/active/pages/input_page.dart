import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:guide_app/src/app/features/active/controllers/active_controller.dart';

class InputPage extends StatefulWidget {
  InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late final ActiveController _controller;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _controller = Get.find<ActiveController>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.messaError.listen((value) {
      if (value.isNotEmpty)
        Get.showSnackbar(GetSnackBar(
          message: value,
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ));
    });
    _controller.activeEntity.listen((value) {
      if (value.currency != null) Get.toNamed('/active_page');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guide App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Informe o nome da ação que deseja consultar',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: _controller.nameController,
                decoration: InputDecoration(
                  hintText: 'Ex: PETR4.SA',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_controller.nameController.text.isEmpty) {
                  Get.showSnackbar(GetSnackBar(
                    message: 'É necessário informar uma ação',
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 5),
                  ));
                  return;
                }
                _controller.getActive(
                  name: _controller.nameController.text.toUpperCase(),
                );
              },
              child: Text('Consultar'),
            ),
          ],
        ),
      ),
    );
  }
}
