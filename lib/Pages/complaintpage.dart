import 'package:cra_complaints/Components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({super.key});

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  final List<String> deptList = <String>[
    'Hostel',
    'Maintenance',
    'Mess',
    'Technical'
  ];
  var dName = 'Hostel';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          const Text(
            'Complaint Form',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            maxLines: 1,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF645CBB))),
              // fillColor: Colors.grey.shade200,
              // filled: true,
              labelText: 'Subject Of The Complaint',
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Row(
              children: [
                const Text(
                  'Select Department: ',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                DropdownButton(
                  value: dName,
                  borderRadius: BorderRadius.circular(5),
                  items: deptList.map((String deptList) {
                    return DropdownMenuItem(
                      value: deptList,
                      child: Text(deptList),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dName = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            maxLines: null,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF645CBB))),
              // fillColor: Colors.grey.shade200,
              // filled: true,
              labelText: 'Describe Your Complaint',
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            maxLines: null,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF645CBB))),
              // fillColor: Colors.grey.shade200,
              // filled: true,
              labelText: 'Suggestion',
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //const CameraPick(),

          //const GalleryPick(),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Row(children: const [
                Text(
                  'Select Image : ',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 10,
                ),
                CameraPick(),
                SizedBox(
                  width: 10,
                ),
                GalleryPick(),
              ]),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SlideAction(
            borderRadius: 12,
            innerColor: const Color(0xFF645CBB),
            outerColor: Colors.white,
            sliderButtonIcon: const Icon(
              Icons.send_rounded,
              color: Colors.white,
            ),
            text: 'Swipe To Submit',
            textStyle: const TextStyle(
              color: Colors.black54,
              fontSize: 24,
            ),
            sliderRotate: false,
            onSubmit: () {},
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
