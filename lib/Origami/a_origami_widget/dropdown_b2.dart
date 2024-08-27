import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownButtonV2 extends StatefulWidget {
  const DropdownButtonV2({super.key});

  @override
  State<DropdownButtonV2> createState() => _DropdownButtonV2State();
}

class _DropdownButtonV2State extends State<DropdownButtonV2> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: const Row(
              children: [
                Icon(
                  Icons.list,
                  size: 16,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    'Select Item',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items
                .map((String item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ))
                .toList(),
            value: selectedValue,
            onChanged: (String? value) {
              setState(() {
                selectedValue = value;
              });
            },
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: 160,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: Colors.redAccent,
              ),
              elevation: 2,
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              iconSize: 14,
              iconEnabledColor: Colors.yellow,
              iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.redAccent,
              ),
              offset: const Offset(-20, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all<double>(6),
                thumbVisibility: MaterialStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ),
        ),
      ),
    );
  }
}

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  MyObject? selectedObject;

  final List<MyObject> objects = [
    MyObject('Object 1', 1),
    MyObject('Object 2', 2),
    MyObject('Object 3', 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Example'),
      ),
      body: Center(
        child: DropdownButton2<MyObject>(
          hint: Text('Select an object'),
          value: selectedObject,
          items: objects.map((MyObject object) {
            return DropdownMenuItem<MyObject>(
              value: object,
              child: Text(object.name),
            );
          }).toList(),
          onChanged: (MyObject? newValue) {
            setState(() {
              selectedObject = newValue;
            });
          },
        ),
      ),
    );
  }
}

class DropdownExample2 extends StatefulWidget {
  @override
  _DropdownExample2State createState() => _DropdownExample2State();
}

class _DropdownExample2State extends State<DropdownExample2> {
  MyObject? selectedObject;

  final List<MyObject> objects = [
    MyObject('Object 1', 1),
    MyObject('Object 2', 2),
    MyObject('Object 3', 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: DropdownButton2<MyObject>(
                hint: Text('Select an object'),
                value: selectedObject,
                items: objects.map((MyObject object) {
                  return DropdownMenuItem<MyObject>(
                    value: object,
                    child: Text(object.name),
                  );
                }).toList(),
                onChanged: (MyObject? newValue) {
                  setState(() {
                    selectedObject = newValue;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            if (selectedObject != null)
              Text('Selected: ${selectedObject!.name}, Value: ${selectedObject!.value}'),
          ],
        ),
      ),
    );
  }
}

class MyObject {
  final String name;
  final int value;

  MyObject(this.name, this.value);
}