import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test find TextFormField widgets', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    final nameTextField = find.byKey(const Key('nameTextField'));
    final phoneTextField = find.byKey(const Key('phoneTextField'));
    final emailTextField = find.byKey(const Key('emailTextField'));

    expect(nameTextField, findsOneWidget);
    expect(phoneTextField, findsOneWidget);
    expect(emailTextField, findsOneWidget);
  });

  testWidgets('Test Form Validation and Submission (Success)',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byKey(const Key('nameTextField')), 'John Doe');
    await tester.enterText(
        find.byKey(const Key('phoneTextField')), '1234567890');
    await tester.enterText(
        find.byKey(const Key('emailTextField')), 'john.doe@example.com');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('1234567890'), findsOneWidget);
    expect(find.text('john.doe@example.com'), findsOneWidget);
  });

  testWidgets('Test Form Validation and Submission (Failure)',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byKey(const Key('nameTextField')), '123');
    await tester.enterText(find.byKey(const Key('phoneTextField')), 'abc');
    await tester.enterText(
        find.byKey(const Key('emailTextField')), 'wrongEmail');

    await tester.ensureVisible(find.byKey(const Key('submitButton')));
    await tester.tap(find.byKey(const Key('submitButton')));

    await tester.pumpAndSettle();

    expect(find.text('Enter Correct Name'), findsOneWidget);
    expect(find.text('Enter Correct Phone Number'), findsOneWidget);
    expect(find.text('Enter Correct Email Address'), findsOneWidget);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(appTitle,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                    )),
          ),
          backgroundColor: Colors.blue[500],
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final yourname = TextEditingController();
  final studentid = TextEditingController();
  final youremail = TextEditingController();

  @override
  void dispose() {
    yourname.dispose();
    studentid.dispose();
    youremail.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final nameRegex = RegExp(r"^[a-zA-Z]");
  final digitRegex = RegExp(r"^[0-9]*$");
  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ImageSection(
                  image: 'images/tak.jpg',
                ),
                const ButtonSection(),
                TextFormField(
                  key: const Key('nameTextField'),
                  controller: yourname,
                  decoration: const InputDecoration(labelText: "Enter Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Correct Name';
                    } else if (!nameRegex.hasMatch(value)) {
                      return "Enter Correct Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  key: const Key('phoneTextField'),
                  controller: studentid,
                  decoration:
                      const InputDecoration(labelText: "Enter Phone Number"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Correct Phone Number';
                    } else if (value.length != 9 && value.length != 10) {
                      return "Enter Correct Phone Number";
                    } else if (!digitRegex.hasMatch(value)) {
                      return "Enter Correct Phone Number";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  key: const Key('emailTextField'),
                  controller: youremail,
                  decoration: const InputDecoration(labelText: "Enter Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Correct Email Address';
                    } else if (!emailRegex.hasMatch(value)) {
                      return "Enter Correct Email Address";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    key: const Key('submitButton'),
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If true do
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Column(
                                children: [
                                  Text(yourname.text),
                                  Text(studentid.text),
                                  Text(youremail.text),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                    //tooltip: 'Show me the value!',
                    child: const Text('Submit Data')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 0),
                child: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 24.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 0),
                child: Icon(
                  Icons.audiotrack,
                  color: Colors.green,
                  size: 30.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 0),
                child: Icon(
                  Icons.beach_access,
                  color: Colors.blue,
                  size: 36.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
