import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:art_sweetalert/art_sweetalert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

final String logo = 'assets/images/logo.png';
final String gender = 'assets/images/gender.png';

class _HomePageState extends State<HomePage> {
  final List<String> city = [
    'Cairo',
    'Helwan',
    'Benha',
    'Giza',
    'Benisuef',
    'Luxor'
  ];
  String _selectedCity = 'Cairo';
  Gradient? _selectedMaleColor;
  Gradient? _selectedFemaleColor;

  final _formKey = GlobalKey<FormState>();

// form values :--
  String _selectedGender = 'not selected';
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dayController = TextEditingController();
  final _monthController = TextEditingController();
  final _yearController = TextEditingController();
  final _countryController = TextEditingController(text: 'Egypt');

  _submitData() {
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final day = _dayController.text;
    final month = _monthController.text;
    final year = _yearController.text;
    final country = _countryController.text;
    final city = _selectedCity;
    if (!_formKey.currentState!.validate() ||
        _selectedGender == 'not selected') {
      return ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.danger,
          title: 'Failed !',
          text: 'Please Enter Valid Data !',
        ),
      );
    }
    // final formData = {
    //   'firstName': firstName,
    //   'lastName': lastName,
    //   'day': day,
    //   'month': month,
    //   'year': year,
    //   'city': city,
    //   'country': country,
    //   'gender': _selectedGender
    // };

    ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertType.success,
        title: 'Data Sent successfully :)',
        text:
            'full name is : $firstName $lastName and i born in : $day / $month / $year living in : $city , $country  i\'m : $_selectedGender',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(0, 244, 67, 54),
          title: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Image.asset(
              logo,
            ),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Personal Information",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Avenir",
                        color: Color(0xFF161B45)),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _firstNameController,
                  style: TextStyle(height: 0.5),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    prefixIcon: Icon(Icons.person),
                    hintText: 'First Name*',
                  ),
                  validator: (value) {
                    if (value != null && value.length < 3) {
                      return 'your first name is too short !';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _lastNameController,
                  validator: (String? value) {
                    if (value != null && value.length < 3) {
                      return 'your last name is too short !';
                    } else {
                      return null;
                    }
                  },
                  style: TextStyle(height: 0.5),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Last Name*',
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 109,
                      child: TextFormField(
                        controller: _dayController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter a correct day !';
                          }
                          if (int.tryParse(value)! > 30 ||
                              int.tryParse(value)! < 1) {
                            return 'enter a correct day !';
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(height: 0.7),
                        keyboardType: TextInputType.datetime,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          prefixIcon: Icon(Icons.date_range),
                          hintText: 'Day*',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 109,
                      child: TextFormField(
                        controller: _monthController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter a correct Month !';
                          }
                          if (int.tryParse(value)! > 12 ||
                              int.tryParse(value)! < 1) {
                            return 'enter a correct Month !';
                          }
                          return null;
                        },
                        style: TextStyle(height: 0.7),
                        keyboardType: TextInputType.datetime,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          hintText: 'Month*',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 109,
                      child: TextFormField(
                        controller: _yearController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter a correct Year !';
                          }
                          if (value.length != 4 ||
                              int.tryParse(value)! > 2022 ||
                              int.tryParse(value)! < 1) {
                            return 'enter a correct year !';
                          }
                          return null;
                        },
                        style: TextStyle(height: 0.7),
                        keyboardType: TextInputType.datetime,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          hintText: 'Year*',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectedGender = 'not selected';
                          _selectedFemaleColor = LinearGradient(
                            colors: [
                              Color.fromARGB(0, 244, 67, 54),
                              Color.fromARGB(0, 33, 149, 243)
                            ],
                          );
                          _selectedMaleColor = LinearGradient(
                            colors: [
                              Color.fromARGB(0, 244, 67, 54),
                              Color.fromARGB(0, 33, 149, 243)
                            ],
                          );
                        });
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(gender),
                                Text(
                                  'Gender*',
                                )
                              ]),
                        ),
                        height: 42,
                        width: 109,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectedGender = 'Female';
                          _selectedMaleColor = LinearGradient(
                            colors: [
                              Color.fromARGB(0, 255, 255, 255),
                              Color.fromARGB(0, 255, 255, 255)
                            ],
                          );
                          _selectedFemaleColor = LinearGradient(
                            colors: [Color(0xFF25D7FB), Color(0xFFDF8FEE)],
                          );
                        });
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: _selectedFemaleColor,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.female,
                                  color: Color(0xFF7d7d7d),
                                ),
                                Text(
                                  'Female',
                                )
                              ]),
                        ),
                        height: 42,
                        width: 109,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectedGender = 'Male';
                          _selectedFemaleColor = LinearGradient(
                            colors: [
                              Color.fromARGB(0, 255, 255, 255),
                              Color.fromARGB(0, 255, 255, 255)
                            ],
                          );
                          _selectedMaleColor = LinearGradient(
                            colors: [Color(0xFF25D7FB), Color(0xFFDF8FEE)],
                          );
                        });
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: _selectedMaleColor,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.male,
                                  color: Color(0xFF7d7d7d),
                                ),
                                Text(
                                  'Male',
                                )
                              ]),
                        ),
                        height: 42,
                        width: 109,
                      ),
                    ),
                  ],
                ),
                if (_selectedGender == 'not selected')
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'please Choose gender !  ',
                      style: TextStyle(
                        color: Theme.of(context).errorColor,
                        fontSize: 11,
                      ),
                    ),
                  ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 175,
                      height: 42,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(50),
                          right: Radius.circular(50),
                        ),
                      ),
                      child: TextFormField(
                        controller: _countryController,
                        enabled: false,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.flag),
                          border: InputBorder.none,
                          hintText: 'Egypt*',
                        ),
                      ),
                    ),
                    Container(
                      width: 175,
                      height: 42,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(50),
                              right: Radius.circular(50))),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton(
                              icon: const Icon(Icons.arrow_drop_down),
                              value: _selectedCity,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedCity = newValue!;
                                });
                              },
                              items: city.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          prefixIcon: Container(
                            margin: EdgeInsets.only(right: 50, left: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100000),
                            ),
                            height: 53,
                            width: 53,
                            child: Icon(
                              Icons.add,
                            ),
                          ),
                          suffixIcon: Container(
                            height: 65,
                            margin: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.cloud_upload,
                              color: Color(0xFF161B45),
                              size: 32,
                            ),
                          ),
                          hintText: 'Upload Profile Picture*',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFF161B45),
                        ),
                        child: TextButton(
                          onPressed: _submitData,
                          child: Text(
                            "DONE",
                            style: TextStyle(
                                color: Color(0xFFffffff),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
