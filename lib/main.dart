import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'student_details.dart';


void main() {
  runApp(const StudentApp());
}


class StudentApp extends StatelessWidget {

  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RegistrationScreen(),
    );

  }
}



class RegistrationScreen extends StatefulWidget {

  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() =>
      _RegistrationScreenState();

}



class _RegistrationScreenState extends State<RegistrationScreen> {


  final nameController = TextEditingController();
  final rollController = TextEditingController();
  final emailController = TextEditingController();
  final cgpaController = TextEditingController();


  bool isLoading = false;



  Future<void> saveStudent() async {


    print("Button pressed");


    var url = Uri.parse(
      "http://192.168.1.10/student_api/insert_student.php",
    );


    try {


      var response = await http.post(

        url,

        body: {

          "name": nameController.text,
          "roll": rollController.text,
          "email": emailController.text,
          "cgpa": cgpaController.text,

        },

      );


      print("Response received");
      print(response.body);



      if(response.statusCode == 200){


        ScaffoldMessenger.of(context).showSnackBar(

          const SnackBar(

            content:
            Text("Student Saved Successfully"),

          ),

        );


        nameController.clear();
        rollController.clear();
        emailController.clear();
        cgpaController.clear();


      }



    }

    catch(e){


      print("ERROR");
      print(e);


    }


  }




  @override
  void dispose(){

    nameController.dispose();
    rollController.dispose();
    emailController.dispose();
    cgpaController.dispose();

    super.dispose();

  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        title:
        const Text("Student Registration"),

      ),



      body: Padding(

        padding:
        const EdgeInsets.all(20),


        child: Column(

          children: [


            TextField(

              controller: nameController,

              decoration:
              const InputDecoration(

                labelText: "Name",

                border:
                OutlineInputBorder(),

              ),

            ),



            const SizedBox(height:15),



            TextField(

              controller: rollController,

              decoration:
              const InputDecoration(

                labelText: "Roll Number",

                border:
                OutlineInputBorder(),

              ),

            ),



            const SizedBox(height:15),



            TextField(

              controller: emailController,

              decoration:
              const InputDecoration(

                labelText: "Email",

                border:
                OutlineInputBorder(),

              ),

            ),



            const SizedBox(height:15),



            TextField(

              controller: cgpaController,

              decoration:
              const InputDecoration(

                labelText: "CGPA",

                border:
                OutlineInputBorder(),

              ),

            ),



            const SizedBox(height:20),



            ElevatedButton(

              onPressed: saveStudent,

              child:
              const Text("Submit"),

            ),



            const SizedBox(height:20),



            ElevatedButton(

              onPressed: (){


                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder:
                    (context)=>
                    const StudentDetails(),

                  ),

                );


              },

              child:
              const Text("Show Details"),

            ),



          ],


        ),


      ),


    );


  }


}