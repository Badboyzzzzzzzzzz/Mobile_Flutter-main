import 'package:flutter/material.dart';
import 'device.dart';

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  Device? _selectedDevice;
  final _amountController = TextEditingController();
  double _convertedAmount = 0.0;
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  @override
  void initState() {
    super.initState();
  }

  void _exchange() {
    final amountText = _amountController.text;
    final amount = double.tryParse(amountText)?? 0;

    setState(() {
      if (_selectedDevice != null) {
        _convertedAmount = amount * _selectedDevice!.rate;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.money,
            size: 60,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Amount in dollars:"),
          const SizedBox(height: 10),
          TextField(
              controller: _amountController,
              decoration: InputDecoration(
                  prefix: const Text('\$ '),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter an amount in dollar',
                  hintStyle: const TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 30),
          const Text("Device"),
          DropdownButton(
            hint: const Text('Please select device'),
            value: _selectedDevice,
            items: Device.values.map((devices) {
              return DropdownMenuItem<Device>(
                value: devices,
                child: Text(devices.name),
              );
            }).toList(),
            onChanged: (Device? value) {
              setState(() {
                _selectedDevice = value;
                _exchange();
              });
            },
          ),
          const SizedBox(height: 30),
          const Text("Amount in selected device:"),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(
                _selectedDevice == null
                    ? "Please selected Device"
                    : '$_convertedAmount ${_selectedDevice!.name}',
              ))
        ],
      )),
    );
  }
}
