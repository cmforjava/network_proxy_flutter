import 'dart:io';

import 'package:brotli/brotli.dart';

///GZIP 解压缩
List<int> gzipDecode(List<int> byteBuffer) {
  GZipCodec gzipCodec = GZipCodec();
  try {
    return gzipCodec.decode(byteBuffer);
  } catch (e) {
    print("gzipDecode error: $e");
    return byteBuffer;
  }
}

///GZIP 压缩
List<int> gzipEncode(List<int> input) {
  return GZipCodec().encode(input);
}

///br 解压缩
List<int> brDecode(List<int> byteBuffer) {
  try {
    return brotli.decode(byteBuffer);
  } catch (e) {
    print("brDecode error: $e");
    return byteBuffer;
  }
}
