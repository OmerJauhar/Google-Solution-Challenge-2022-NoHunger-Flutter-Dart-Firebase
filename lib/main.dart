// import 'dart:html';

// import 'dart:js';

import 'dart:ffi';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/distance.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/geolocation.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_maps_webservice/staticmap.dart';
import 'package:google_maps_webservice/timezone.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MaterialApp(
//
//
//       initialRoute: Welcome.id,
//       routes: {
//         Welcome.id:(context) => Welcome(),
//         Login.id: (context) => Login(),
//         Registration.id: (context) => Registration(),
//
//
//       },
//       home: Welcome()));
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(


      initialRoute: Welcome.id,
      routes: {
        Welcome.id:(context) => Welcome(),
        Login.id: (context) => Login(),
        Registration.id: (context) => Registration(),


      },
      home: Welcome()));
}
class createdonation extends StatefulWidget {
  const createdonation({Key? key}) : super(key: key);
  static const String id = 'create_donation';

  @override
  State<createdonation> createState() => _createdonationState();
}

class _createdonationState extends State<createdonation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => donationpoint()));
            },
            child: Center(
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/appstore.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getCurrentUser();
  // }
  //  final _auth = FirebaseAuth.instance;
  // void getCurrentUser()async{
  //   final user = await _auth.currentUser();
  //   if(user !=null){
  //
  //   }
  //
  // } FirebaseUser LoggedInUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'No Hunger',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                child: SizedBox(
                  height: 20,
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/image 010.png'),
              ),
              Text(
                'No Hunger',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 35.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Keep Calm And End World Hunger',
                style: TextStyle(
                  fontFamily: 'Sorce Sans Pro',
                  color: Colors.teal.shade100,
                  fontSize: 20.0,
                  letterSpacing: .5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
                width: 190,
                child: Divider(
                  thickness: 2,
                  color: Colors.teal.shade100,
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyCustomForm()));
                },
                child: Center(
                  child: Card(
                    child: Image(
                      image: AssetImage('assets/image 6.PNG'),
                    ),
                  ),
                ),
              ),
              Container(
                child: SizedBox(
                  height: 7,
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => fulfill()));
                },
                child: Center(
                  child: Card(
                    child: Image(
                      image: AssetImage('assets/image 7.PNG'),
                    ),
                  ),
                ),
              ),
              Container(
                child: SizedBox(
                  height: 7,
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => donationpoint()));
                },
                child: Center(
                  child: Card(
                    child: Image(
                      image: AssetImage('assets/image 5.PNG'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class request extends StatelessWidget {
  const request({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
              child: Center(
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/image 010.png'),
                ),
              ),
            ),
          ],
        ),
      ),

      backgroundColor: Colors.teal.shade400,

      //   BackButton(
      //   onPressed:(){
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
      //   },
      // ),
    );
  }
}

class fulfill extends StatefulWidget {
  const fulfill({Key? key}) : super(key: key);

  @override
  State<fulfill> createState() => _fulfillState();
}

class _fulfillState extends State<fulfill> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('home')
      .snapshots(includeMetadataChanges: true);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          body:Column(
            children: [
              SizedBox(
                height: 15,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MyApp()));
                },
                child: Center(
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/appstore.png'),
                  ),
                ),
              ),
              Flexible(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _usersStream,
                  builder:
                      (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    // if (snapshot.connectionState == ConnectionState.waiting) {
                    //   return Center(child: Text("Loading"));
                    // }

                    return ListView(
                      children: snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                        return ListTile(
                          title: Text('𝗡𝗔𝗠𝗘 : '+data['Name'],style: TextStyle(
                              color: Colors.teal,
                              fontFamily: 'SourceSansPro',
                              fontSize: 25
                          ),),
                          subtitle: Text('Phone Number : '+data['Phone']+'\n'
                              +'Country : '+data['Country']+'\n'+'Amount : '+data['Ammount']+'\n'+'Account Number : '+data["AccountNumber"]+'\n________________________________________________________',style: TextStyle(
                              fontSize:15 ,
                              fontWeight: FontWeight.bold
                          ),),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          )

      ),
    );
    ;
  }
}


class donationpoint extends StatelessWidget {
  const donationpoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
              child: Center(
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/image 010.png'),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => createdonation()));
              },
              child: Center(
                child: Card(
                  child: Image(
                    image: AssetImage('assets/meow4.PNG'),
                  ),
                ),
              ),
            ),
            Container(
              child: SizedBox(
                height: 15,
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => searchdonation()));
              },
              child: Center(
                child: Card(
                  child: Image(
                    image: AssetImage('assets/meow3.PNG'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      backgroundColor: Colors.teal.shade400,

      //   BackButton(
      //   onPressed:(){
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
      //   },
      // ),
    );
  }
}
class searchdonation extends StatefulWidget {
  const searchdonation({Key? key}) : super(key: key);

  @override
  State<searchdonation> createState() => _searchdonationState();
}

class _searchdonationState extends State<searchdonation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => donationpoint()));
            },
            child: Center(
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/appstore.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  int number = 1;
  TextEditingController name = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController amount = new TextEditingController();
  TextEditingController country = new TextEditingController();
  TextEditingController AccountNumber = new TextEditingController();

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
            child: Center(
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/appstore.png'),
              ),
            ),
          ),
          SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: name,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter your name',
                      labelText: 'Name',
                    ),
                  ),
                  TextFormField(
                    controller: phone,
                    decoration: const InputDecoration(
                      icon: Text('☎'),
                      hintText: 'Enter a phone number',
                      labelText: 'Phone',
                    ),
                  ),
                  TextFormField(
                    controller: amount,
                    decoration: const InputDecoration(
                      icon: Text('💲'),
                      hintText: 'Enter amount you require',
                      labelText: 'Amount Required',
                    ),
                  ),
                  TextFormField(
                    controller: country,
                    decoration: const InputDecoration(
                      // icon: const Icon(Icons.flag),
                      icon: Text('🌏'),
                      hintText: 'Enter Your Country ',
                      labelText: 'eg: Pakistan',
                    ),
                  ),
                  TextFormField(
                    controller: AccountNumber,
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      icon: Text('💳'),
                      hintText: 'Enter Your Banking Service Provider',
                      labelText: 'eg : easypaisa,jazz cash , HBL',
                    ),
                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                      child: new RaisedButton(
                        color: Colors.yellow,
                        child: const Text('Submit'),
                        onPressed: () {
                          Map<String, dynamic> data1 = {
                            "Name": name.text,
                            "Phone": phone.text,
                            "Ammount": amount.text,
                            "Country": country.text,
                            "AccountNumber": AccountNumber.text
                          };
                          FirebaseFirestore.instance
                              .collection("home")
                              .add(data1);
                        },
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Welcome extends StatefulWidget {
  static const String id = 'Welcome1';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  child: Image.asset('assets/image 010.png'),
                  height: 60.0,
                ),
                Text(
                  '  No Hunger ',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Pacifico',
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Login.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Registration.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Registration extends StatefulWidget {
  static const String id = 'Registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<Registration> {

  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 100.0,
              child: Image.asset('assets/image 010.png'),
            ),
            Center(
              child: Text(
                  'No Hunger',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 35.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  )),
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value ;
                //Do something with the user input.
              },
              decoration: InputDecoration(
                fillColor: Colors.white,filled: true,

                hintText: 'Enter your email',
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow.shade500, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value ;
              },
              decoration: InputDecoration(
                fillColor: Colors.white,filled: true,
                // fillColor: Colors.white,
                hintText: 'Enter your password',
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow.shade500, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.yellow,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () async {

                    try {
                      final newuser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      if (newuser !=null){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                      }
                    }
                    catch (e) {
                      print(e);
                    }
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white,fontSize: 25,fontWeight:FontWeight.bold,fontFamily: 'SourceSansPro',letterSpacing: 1 ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class Login extends StatefulWidget {
  static const String id = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 100.0,
              child: Image.asset('assets/image 010.png'),
            ),
            Center(
              child: Text(
                  'No Hunger',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 35.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  )),
            ),

            TextField(
              onChanged: (value) {
                email = value ;

              },
              decoration: InputDecoration(
                fillColor: Colors.white , filled: true,
                hintText: 'Enter your email',
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.grey, width: 1.5),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.yellow.shade500, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                password = value ;
              },
              decoration: InputDecoration(
                fillColor: Colors.white,filled: true,
                hintText: 'Enter your password.',
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.grey, width: 1.5),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.yellow.shade500, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.yellow,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () async{
                    try {final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                    if (user!=null){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                    }}
                    catch (e){
                      print(e) ;
                    }
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}