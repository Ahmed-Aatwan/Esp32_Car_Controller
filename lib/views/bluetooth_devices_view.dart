import 'package:flutter/material.dart';
import 'package:grad_project/app_localizations.dart';
import 'package:grad_project/provider/bluetooth_provider.dart';
import 'package:provider/provider.dart';

class BluetoothDevicesView extends StatefulWidget {
  const BluetoothDevicesView({super.key});

  @override
  State<BluetoothDevicesView> createState() => _BluetoothDevicesViewState();
}

class _BluetoothDevicesViewState extends State<BluetoothDevicesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('devices')),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              Provider.of<BluetoothProvider>(
                context,
                listen: false,
              ).scanForDevices();
            },
          ),
        ],
      ),
      body: Consumer<BluetoothProvider>(
        builder: (context, bluetoothProvider, child) {
          if (bluetoothProvider.scanResults.isEmpty) {
            return Center(
              child: Text(
                '${AppLocalizations.of(context).translate('devices')} ${AppLocalizations.of(context).translate('notconnected')}',
                textAlign: TextAlign.center,
              ),
            );
          }

          return ListView.builder(
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
                    await bluetoothProvider.connectToDevice(device, context);
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
    );
  }

  @override
  void initState() {
    super.initState();
    _startBluetoothScan();
  }

  Future<void> _startBluetoothScan() async {
    final provider = Provider.of<BluetoothProvider>(context, listen: false);
    await provider.requestPermission(context);
    provider.scanForDevices();
  }
}
