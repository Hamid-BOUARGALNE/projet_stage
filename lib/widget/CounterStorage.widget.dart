import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
//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
class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/scanner.txt');
  }

  Future<String> readCounter() async {
    try {
      final file = await _localFile;
      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return "";
    }
  }

  Future<File> writeCounter(String counter) async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString("$counter\n",mode: FileMode.append);
  }
}