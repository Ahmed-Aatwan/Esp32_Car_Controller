import 'package:flutter/material.dart';
import 'package:grad_project/app_localizations.dart';
import 'package:grad_project/provider/bluetooth_provider.dart';
import 'package:grad_project/views/control_options_view.dart';
import 'package:grad_project/views/settings_view.dart';
import 'package:grad_project/views/status_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const ControlOptionsView(),
      const StatusView(),
      const SettingsView(),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.dashboard),
            label: AppLocalizations.of(context).translate('options'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.query_stats_rounded),
            label: AppLocalizations.of(context).translate('status'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: AppLocalizations.of(context).translate('settings'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBluetoothDevicesDialog(context),
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        child: const Icon(Icons.bluetooth, color: Colors.white),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    try {
      await Provider.of<BluetoothProvider>(
        context,
        listen: false,
      ).requestPermission(context);
    } catch (e) {
      _showErrorDialog(
        context,
        'Permission Error',
        'Failed to request permissions.',
      );
    }
  }

  void _showBluetoothDevicesDialog(BuildContext context) {
    final bluetoothProvider = Provider.of<BluetoothProvider>(
      context,
      listen: false,
    );
    bluetoothProvider.scanForDevices();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context).translate('select')),
          content: SizedBox(
            width: double.maxFinite,
            child: Consumer<BluetoothProvider>(
              builder: (context, bluetoothProvider, child) {
                if (bluetoothProvider.scanResults.isEmpty) {
                  return Text(
                    AppLocalizations.of(context).translate('notconnected'),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: bluetoothProvider.scanResults.length,
                  itemBuilder: (context, index) {
                    final result = bluetoothProvider.scanResults[index];
                    final device = result.device;
                    return ListTile(
                      title: Text(
                        device.platformName.isNotEmpty
                            ? device.platformName
                            : AppLocalizations.of(context).translate('unknown'),
                      ),
                      subtitle: Text('RSSI: ${result.rssi}'),
                      trailing: ElevatedButton(
                        onPressed: () async {
                          await bluetoothProvider.connectToDevice(
                            device,
                            context,
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context).translate('connect'),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
