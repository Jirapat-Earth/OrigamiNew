import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

Future<File?> downloadFile(String url, String filename) async {
  try {
    final tempDir = await getTemporaryDirectory();
    final filePath = '${tempDir.path}/$filename';

    final dio = Dio();
    final response = await dio.download(url, filePath, options: Options(
      validateStatus: (status) => status! < 500, // Handle status codes less than 500
    ));

    if (response.statusCode == 200) {
      return File(filePath);
    } else {
      print('Failed to download file: ${response.statusCode} ${response.statusMessage}');
      return null;
    }
  } catch (e) {
    print('Error downloading file: $e');
    return null;
  }
}

Future<void> openDownloadedFile(String url, String filename) async {
  final file = await downloadFile(url, filename);
  if (file != null) {
    print('File downloaded to: ${file.path}');
    final result = await OpenFile.open(file.path);
    print('Open result: ${result.message}');
  } else {
    print('Failed to download file.');
  }
}
