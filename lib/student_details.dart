import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class StudentDetails extends StatefulWidget {


  const StudentDetails({super.key});


  @override
  State<StudentDetails> createState() =>
      _StudentDetailsState();


}




class _StudentDetailsState
    extends State<StudentDetails> {



  List students = [];

  bool loading = true;




  Future<void> fetchStudents() async {


    var url = Uri.parse(

      "http://192.168.1.10/student_api/fetch_students.php",

    );



    try {


      var response =
      await http.get(url);



      if(response.statusCode == 200){


        setState(() {


          students =
              jsonDecode(response.body);


          loading = false;


        });
        
      }else {
        setState(() {
          loading = false;
        });

      print("Status Code: ${response.statusCode}");


    }
  }

    catch(e){
      print("ERROR: $e");

      setState(() {
      loading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
        ),
      );


    }



  }





  @override
  void initState(){


    super.initState();

    fetchStudents();


  }





  @override
  Widget build(BuildContext context){


    return Scaffold(


      appBar:
      AppBar(

        title:
        const Text(
          "Student Records",
        ),

      ),




      body:

      loading

          ?

      const Center(

        child:
        CircularProgressIndicator(),

      )



          :

      ListView.builder(


        itemCount:
        students.length,



        itemBuilder:
            (context,index){



          var student =
          students[index];



          return Card(


            margin:
            const EdgeInsets.all(10),


            child:
            ListTile(



              title:
              Text(
                student['name'] ?? "No Name",
              ),



              subtitle:
              Text(

                "Roll: ${student['roll_number'] ?? "N/A"}\n"
                    "Email: ${student['email'] ?? "N/A"}",

              ),



              trailing:
              Text(
                student['cgpa'] ?? "N/A",
              ),


            ),


          );


        },


      ),


    );


  }


}