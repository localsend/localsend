import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/constants.dart';
import 'package:localsend_app/service/receiver_service.dart';
import 'package:network_info_plus/network_info_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _receiver = ReceiverService();
  String? _ip;
  String? _mask;

  String _targetIp = '';
  String? _response;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final info = NetworkInfo();
    _ip = await info.getWifiIP();
    _mask = await info.getWifiSubmask();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: [
            Text('IP: $_ip'),
            Text('Mask: $_mask'),
            Text('Status: ${_receiver.running}'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await _receiver.start();
                    setState(() {});
                  },
                  child: const Text('Start'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () async {
                    await _receiver.stop();
                    setState(() {});
                  },
                  child: const Text('Stop'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (s) {
                setState(() {
                  _targetIp = s;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  final response = await Dio().get('http://$_targetIp:${Constants.defaultPort}/hello');
                  setState(() {
                    _response = response.data.toString();
                  });
                } catch (e) {
                  print(e);
                  setState(() {
                    _response = e.toString();
                  });
                }
              },
              child: const Text('Ping'),
            ),
            const SizedBox(height: 20),
            Text('Response: $_response'),
          ],
        ),
      ),
    );
  }
}
