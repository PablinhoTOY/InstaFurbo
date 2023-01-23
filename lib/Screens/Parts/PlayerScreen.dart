import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:insta_furbo/Pages/login.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: const Formulario(),
    );
  }
}

const options = ['A', 'B', 'C', 'D'];

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  final _questionCtrl = TextEditingController();
  final _optionCtrls = options.map((o) => TextEditingController()).toList();
  final _question = {'value': '', 'correct': options[0], 'options': options};

  void showSnackbar({required bool success, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.only(
          right: 16,
          left: 16,
        ),
        behavior: SnackBarBehavior.floating,
        content: Row(children: [
          Icon(
            success ? Icons.gpp_good : Icons.error,
            color: success ? Colors.greenAccent : Colors.redAccent,
          ),
          const SizedBox(width: 8),
          Text(text),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    _questionCtrl.dispose();
    for (var ctrl in _optionCtrls) {
      ctrl.dispose();
    }
    super.dispose();
  }

  void _openMyPage() {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre *'),
                validator: (v) =>
                    v!.isEmpty ? 'Asegurese de llenar este campo!' : null,
              ),
              const SizedBox(height: 32),
              const Text(''),
              Row(
                  children: options
                      .map((option) => [
                            Radio<String>(
                              value: option,
                              groupValue: _question['correct'] as String,
                              onChanged: (v) =>
                                  setState(() => _question['correct'] = v!),
                            ),
                            Text(option),
                            const SizedBox(width: 16)
                          ])
                      .expand((w) => w)
                      .toList()),
              const SizedBox(height: 32),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre *'),
                validator: (v) =>
                    v!.isEmpty ? 'Asegurese de llenar este campo!' : null,
              ),
              const SizedBox(height: 32),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre *'),
                validator: (v) =>
                    v!.isEmpty ? 'Asegurese de llenar este campo!' : null,
              ),
              const SizedBox(height: 32),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre *'),
                validator: (v) =>
                    v!.isEmpty ? 'Asegurese de llenar este campo!' : null,
              ),
              const SizedBox(height: 32),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre *'),
                validator: (v) =>
                    v!.isEmpty ? 'Asegurese de llenar este campo!' : null,
              ),
              const SizedBox(height: 32),
              const SizedBox(height: 32),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 54, 131, 57),
                  ),
                   onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _question['value'] = _questionCtrl.text;
                      _question['options'] = _optionCtrls.asMap().entries.map(
                        (entry) {
                          return {
                            'index': options[entry.key],
                            'value': entry.value.text
                          };
                        },
                      );
                      if (kDebugMode) {
                        print(_question);
                      }
                      showSnackbar(
                        success: true,
                        text: 'Question updated successfully.',
                      );
                    } else {
                      showSnackbar(
                        success: false,
                        text: 'Porfavor llene todos los campos.',
                      );
                    }
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  },
                  child: const Text('Registrar'),
                )
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}
