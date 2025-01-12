import 'package:flutter/material.dart';

class ConverterHome extends StatefulWidget {
  const ConverterHome({Key? key}) : super(key: key);

  @override
  _ConverterHomeState createState() => _ConverterHomeState();
}

class _ConverterHomeState extends State<ConverterHome> {
  String _conversionType = 'Temperature';
  String _fromUnit = 'Celsius';
  String _toUnit = 'Fahrenheit';
  double _inputValue = 0.0;
  double _convertedValue = 0.0;

  final List<String> _temperatureUnits = ['Celsius', 'Fahrenheit', 'Kelvin'];
  final List<String> _currencyUnits = ['USD', 'EUR', 'GBP', 'JPY', 'IDR'];
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();

  void _convert({bool isInput = true}) {
    setState(() {
      if (_conversionType == 'Temperature') {
        if (isInput) {
          if (_fromUnit == 'Celsius') {
            if (_toUnit == 'Fahrenheit') {
              _convertedValue = (_inputValue * 9 / 5) + 32;
            } else if (_toUnit == 'Kelvin') {
              _convertedValue = _inputValue + 273.15;
            }
          } else if (_fromUnit == 'Fahrenheit') {
            if (_toUnit == 'Celsius') {
              _convertedValue = (_inputValue - 32) * 5 / 9;
            } else if (_toUnit == 'Kelvin') {
              _convertedValue = (_inputValue - 32) * 5 / 9 + 273.15;
            }
          } else if (_fromUnit == 'Kelvin') {
            if (_toUnit == 'Celsius') {
              _convertedValue = _inputValue - 273.15;
            } else if (_toUnit == 'Fahrenheit') {
              _convertedValue = (_inputValue - 273.15) * 9 / 5 + 32;
            }
          }
          _outputController.text = _convertedValue.toString();
        } else {
          if (_toUnit == 'Celsius') {
            if (_fromUnit == 'Fahrenheit') {
              _inputValue = (_convertedValue - 32) * 5 / 9;
            } else if (_fromUnit == 'Kelvin') {
              _inputValue = _convertedValue - 273.15;
            }
          } else if (_toUnit == 'Fahrenheit') {
            if (_fromUnit == 'Celsius') {
              _inputValue = (_convertedValue * 9 / 5) + 32;
            } else if (_fromUnit == 'Kelvin') {
              _inputValue = (_convertedValue - 273.15) * 9 / 5 + 32;
            }
          } else if (_toUnit == 'Kelvin') {
            if (_fromUnit == 'Celsius') {
              _inputValue = _convertedValue + 273.15;
            } else if (_fromUnit == 'Fahrenheit') {
              _inputValue = (_convertedValue - 32) * 5 / 9 + 273.15;
            }
          }
          _inputController.text = _inputValue.toString();
        }
      } else if (_conversionType == 'Currency') {
        if (isInput) {
          if (_fromUnit == 'USD') {
            if (_toUnit == 'EUR') {
              _convertedValue = _inputValue * 0.85; // Example conversion rate
            } else if (_toUnit == 'GBP') {
              _convertedValue = _inputValue * 0.75; // Example conversion rate
            } else if (_toUnit == 'JPY') {
              _convertedValue = _inputValue * 110.0; // Example conversion rate
            } else if (_toUnit == 'IDR') {
              _convertedValue =
                  _inputValue * 14200.0; // Example conversion rate
            }
          } else if (_fromUnit == 'EUR') {
            if (_toUnit == 'USD') {
              _convertedValue = _inputValue * 1.18; // Example conversion rate
            } else if (_toUnit == 'GBP') {
              _convertedValue = _inputValue * 0.88; // Example conversion rate
            } else if (_toUnit == 'JPY') {
              _convertedValue = _inputValue * 129.53; // Example conversion rate
            } else if (_toUnit == 'IDR') {
              _convertedValue =
                  _inputValue * 16700.0; // Example conversion rate
            }
          } else if (_fromUnit == 'GBP') {
            if (_toUnit == 'USD') {
              _convertedValue = _inputValue * 1.33; // Example conversion rate
            } else if (_toUnit == 'EUR') {
              _convertedValue = _inputValue * 1.14; // Example conversion rate
            } else if (_toUnit == 'JPY') {
              _convertedValue = _inputValue * 147.32; // Example conversion rate
            } else if (_toUnit == 'IDR') {
              _convertedValue =
                  _inputValue * 19000.0; // Example conversion rate
            }
          } else if (_fromUnit == 'JPY') {
            if (_toUnit == 'USD') {
              _convertedValue = _inputValue * 0.0091; // Example conversion rate
            } else if (_toUnit == 'EUR') {
              _convertedValue = _inputValue * 0.0077; // Example conversion rate
            } else if (_toUnit == 'GBP') {
              _convertedValue = _inputValue * 0.0068; // Example conversion rate
            } else if (_toUnit == 'IDR') {
              _convertedValue = _inputValue * 130.0; // Example conversion rate
            }
          } else if (_fromUnit == 'IDR') {
            if (_toUnit == 'USD') {
              _convertedValue =
                  _inputValue * 0.000070; // Example conversion rate
            } else if (_toUnit == 'EUR') {
              _convertedValue =
                  _inputValue * 0.000060; // Example conversion rate
            } else if (_toUnit == 'GBP') {
              _convertedValue =
                  _inputValue * 0.000053; // Example conversion rate
            } else if (_toUnit == 'JPY') {
              _convertedValue = _inputValue * 0.0077; // Example conversion rate
            }
          }
          _outputController.text = _convertedValue.toString();
        } else {
          if (_toUnit == 'USD') {
            if (_fromUnit == 'EUR') {
              _inputValue = _convertedValue / 0.85; // Example conversion rate
            } else if (_fromUnit == 'GBP') {
              _inputValue = _convertedValue / 0.75; // Example conversion rate
            } else if (_fromUnit == 'JPY') {
              _inputValue = _convertedValue / 110.0; // Example conversion rate
            } else if (_fromUnit == 'IDR') {
              _inputValue =
                  _convertedValue / 14200.0; // Example conversion rate
            }
          } else if (_toUnit == 'EUR') {
            if (_fromUnit == 'USD') {
              _inputValue = _convertedValue / 1.18; // Example conversion rate
            } else if (_fromUnit == 'GBP') {
              _inputValue = _convertedValue / 0.88; // Example conversion rate
            } else if (_fromUnit == 'JPY') {
              _inputValue = _convertedValue / 129.53; // Example conversion rate
            } else if (_fromUnit == 'IDR') {
              _inputValue =
                  _convertedValue / 16700.0; // Example conversion rate
            }
          } else if (_toUnit == 'GBP') {
            if (_fromUnit == 'USD') {
              _inputValue = _convertedValue / 1.33; // Example conversion rate
            } else if (_fromUnit == 'EUR') {
              _inputValue = _convertedValue / 1.14; // Example conversion rate
            } else if (_fromUnit == 'JPY') {
              _inputValue = _convertedValue / 147.32; // Example conversion rate
            } else if (_fromUnit == 'IDR') {
              _inputValue =
                  _convertedValue / 19000.0; // Example conversion rate
            }
          } else if (_toUnit == 'JPY') {
            if (_fromUnit == 'USD') {
              _inputValue = _convertedValue / 0.0091; // Example conversion rate
            } else if (_fromUnit == 'EUR') {
              _inputValue = _convertedValue / 0.0077; // Example conversion rate
            } else if (_fromUnit == 'GBP') {
              _inputValue = _convertedValue / 0.0068; // Example conversion rate
            } else if (_fromUnit == 'IDR') {
              _inputValue = _convertedValue / 130.0; // Example conversion rate
            }
          } else if (_toUnit == 'IDR') {
            if (_fromUnit == 'USD') {
              _inputValue =
                  _convertedValue / 0.000070; // Example conversion rate
            } else if (_fromUnit == 'EUR') {
              _inputValue =
                  _convertedValue / 0.000060; // Example conversion rate
            } else if (_fromUnit == 'GBP') {
              _inputValue =
                  _convertedValue / 0.000053; // Example conversion rate
            } else if (_fromUnit == 'JPY') {
              _inputValue = _convertedValue / 0.0077; // Example conversion rate
            }
          }
          _inputController.text = _inputValue.toString();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: _conversionType,
              onChanged: (String? newValue) {
                setState(() {
                  _conversionType = newValue!;
                  _fromUnit =
                      _conversionType == 'Temperature' ? 'Celsius' : 'USD';
                  _toUnit =
                      _conversionType == 'Temperature' ? 'Fahrenheit' : 'EUR';
                  _inputController.clear();
                  _outputController.clear();
                });
              },
              items: <String>['Temperature', 'Currency']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: _fromUnit,
                    onChanged: (String? newValue) {
                      setState(() {
                        _fromUnit = newValue!;
                        _inputController.clear();
                        _outputController.clear();
                      });
                    },
                    items: (_conversionType == 'Temperature'
                            ? _temperatureUnits
                            : _currencyUnits)
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _inputController,
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(labelText: 'Input Value ($_fromUnit)'),
                    onSubmitted: (String value) {
                      _inputValue = double.tryParse(value) ?? 0.0;
                      _convert(isInput: true);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: _toUnit,
                    onChanged: (String? newValue) {
                      setState(() {
                        _toUnit = newValue!;
                        _inputController.clear();
                        _outputController.clear();
                      });
                    },
                    items: (_conversionType == 'Temperature'
                            ? _temperatureUnits
                            : _currencyUnits)
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _outputController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Converted Value ($_toUnit)'),
                    onSubmitted: (String value) {
                      _convertedValue = double.tryParse(value) ?? 0.0;
                      _convert(isInput: false);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
