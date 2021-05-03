import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:image_upload_flutter/extracts.dart';
import 'package:image_upload_flutter/screens/main_screen.dart';

class ImageUpload extends StatefulWidget {
  static const String id = 'image_upload';

  final String username;
  ImageUpload({this.username});

  @override
  State<StatefulWidget> createState() {
    return _ImageUpload();
  }
}

class _ImageUpload extends State<ImageUpload> {
  TextEditingController aboutImageController = TextEditingController();
  File uploadimage;

  Future chooseImage() async {
    var choosedimage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    //set source: ImageSource.camera to get image from camera
    setState(() {
      uploadimage = File(choosedimage.path);
    });
  }

  Future uploadImage() async {
    //show your own loading or progressing code here

    String uploadurl = "${URL.url}upload_image.php";
    Uri url = Uri.parse(uploadurl);
    var request = http.MultipartRequest('POST', url);
    request.fields['aboutImage'] = aboutImageController.text;
    var picture = await http.MultipartFile.fromPath('image', uploadimage.path);
    request.files.add(picture);
    var response = await request.send();

    if (response.statusCode == 200) {
      print('Image Uploaded');
      print(request.fields['aboutImage']);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MainScreen(
                    getUsername: widget.username,
                  )));
    } else {
      print('Image Not Uploaded');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Image to Server"),
        backgroundColor: Color(0xFF8D33B6),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 550,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, //content alignment to center
            children: [
              Container(
                  //show image here after choosing image
                  child: uploadimage == null
                      ? Container()
                      : //if uploadimage is null then show empty container
                      Container(
                          //elese show image here
                          child: SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: Image.file(uploadimage), //load image from file
                        ))),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: aboutImageController,
                  decoration: InputDecoration(
                    labelText: 'about image',
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    // ),
                  ),
                ),
              ),
              Container(
                  //show upload button after choosing image
                  child: uploadimage == null
                      ? Container()
                      : //if uploadimage is null then show empty container
                      Container(
                          //elese show uplaod button
                          child: RaisedButton.icon(
                          onPressed: () {
                            uploadImage();
                            //start uploading image
                          },
                          icon: Icon(Icons.file_upload),
                          label: Text("UPLOAD IMAGE"),
                          color: Color(0xFF8D33B6),
                          colorBrightness: Brightness.dark,
                          //set brghtness to dark, because purple is darker color
                          //so that its text color is light
                        ))),
              Container(
                child: RaisedButton.icon(
                  onPressed: () {
                    chooseImage(); // call choose image function
                  },
                  icon: Icon(Icons.folder_open),
                  label: Text("CHOOSE IMAGE"),
                  color: Color(0xFF8D33B6),
                  colorBrightness: Brightness.dark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
