import 'package:flutter/material.dart';

import 'download_file_pdf.dart';

class MyHomePagePdf extends StatefulWidget {
  const MyHomePagePdf({
    super.key,
  });


  @override
  State<MyHomePagePdf> createState() => MyHomePagePdfState();
}

class MyHomePagePdfState extends State<MyHomePagePdf> {

  final String fileUrl = 'https://origami-system.obs.ap-southeast-2.myhuaweicloud.com:443/uploads/need/5/12929/shsb4k835d797e01.pdf?AWSAccessKeyId=XQQASUZBT0FWUE8ZREM3&Expires=1723091196&Signature=LbDsaacC2Pm78yQeMpo1FVITc%2BU%3D';
  final String filename = 'shsb4k835d797e01.pdf';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Download Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            openDownloadedFile(fileUrl, filename);
          },
          child: Text('Download and Open File'),
        ),
      ),
    );
  }
}