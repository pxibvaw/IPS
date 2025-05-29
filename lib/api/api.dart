import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

Future<Map<String, dynamic>> sendPoopData({
  required File imageFile,
  required String countInput,
  required String smellInput,
  required String amountInput,
}) async {
  print("📡 백엔드 호출 시작");

  final uri = Uri.parse("http://127.0.0.1:8000/predict/");

  final request = http.MultipartRequest("POST", uri)
    ..fields['count'] = countInput
    ..fields['smell'] = smellInput
    ..fields['amount'] = amountInput
    ..files.add(
      await http.MultipartFile.fromPath(
        'image',
        imageFile.path,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

  final streamedResponse = await request.send();
  final response = await http.Response.fromStream(streamedResponse);

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception("서버 응답 오류: ${response.statusCode} ${response.body}");
  }
}
