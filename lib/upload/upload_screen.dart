import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:convert';
import 'package:my_figma_app/smell/smell_screen.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  html.File? _selectedFile;
  String? _uploadedFileName;

  void _pickAndUploadImage() {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.accept = 'image/*';
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final file = uploadInput.files!.first;
      setState(() {
        _selectedFile = file;
      });

      final formData = html.FormData();
      formData.appendBlob('file', file.slice(), file.name);

      final request = html.HttpRequest();
      request
        ..open('POST', 'http://localhost:8000/upload')
        ..onLoadEnd.listen((event) {
          if (request.status == 200) {
            final response = jsonDecode(request.responseText!);
            print('✅ 업로드 성공: \$response');
            setState(() {
              _uploadedFileName = response['filename'];
            });
          } else {
            print('❌ 업로드 실패: 상태코드 \${request.status}');
          }
        })
        ..onError.listen((event) {
          print('❌ 요청 에러 발생');
        })
        ..send(formData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 24),
            Text(
              "응가 사진을\n업로드 해주세요",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _pickAndUploadImage,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 278,
                    height: 232,
                    decoration: BoxDecoration(
                      color: Color(0x7FE2D9D3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Column(
                    children: [
                      Image.asset("assets/ddong_search.png", width: 118, height: 118),
                      SizedBox(height: 8),
                      Text("클릭하여 사진 선택하기", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 24),
            if (_uploadedFileName != null)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SmellScreen(),
                      settings: RouteSettings(arguments: {
                        'imagePath': _uploadedFileName
                      }),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Color(0xFFEBF3FF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text("Poop Check", style: TextStyle(fontSize: 17)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}