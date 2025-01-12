import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcHome extends StatefulWidget {
  const CalcHome({Key? key}) : super(key: key);

  @override
  _CalcHomeState createState() => _CalcHomeState();
}

class _CalcHomeState extends State<CalcHome> {
  String _expression = '';
  String _result = '';

  void _onPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _expression = '';
        _result = '';
      } else if (buttonText == '⌫') {
        if (_expression.isNotEmpty) {
          _expression = _expression.substring(0, _expression.length - 1);
        }
      } else if (buttonText == '=') {
        try {
          Parser p = Parser();
          Expression exp = p.parse(_expression);
          ContextModel cm = ContextModel();
          _result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          _result = 'Error';
        }
      } else {
        _expression += buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(5),
              alignment: Alignment.bottomRight,
              child: Text(
                _expression,
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(5),
              alignment: Alignment.bottomRight,
              child: Text(
                _result,
                style: TextStyle(fontSize: 48),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Column(
              children: [
                Wrap(
                  spacing: 2,
                  runSpacing: 2,
                  children: <String>[
                    'sin',
                    'cos',
                    'tan',
                    '⌫',
                    'C',
                    '(',
                    ')',
                    '^',
                    'sqrt',
                    ''
                  ].map((buttonText) {
                    return SizedBox(
                      width: (MediaQuery.of(context).size.width - 12) / 5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // primary: buttonText == '=' ? Color(0xFF5A5AB4) : null,
                          // onPrimary: buttonText == '=' ? Colors.white : null,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () => _onPressed(buttonText),
                        child: Text(
                          buttonText,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 4,
                    padding: EdgeInsets.all(2),
                    children: <String>[
                      '7',
                      '8',
                      '9',
                      '/',
                      '4',
                      '5',
                      '6',
                      '*',
                      '1',
                      '2',
                      '3',
                      '-',
                      '.',
                      '0',
                      '',
                      '+',
                      '',
                      '',
                      '',
                      '=',
                    ].map((buttonText) {
                      return GridTile(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  buttonText == '=' ? Color(0xFF5A5AB4) : null,
                              foregroundColor:
                                  buttonText == '=' ? Colors.white : null,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            onPressed: () => _onPressed(buttonText),
                            child: Text(
                              buttonText,
                              style: TextStyle(fontSize: 32),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
