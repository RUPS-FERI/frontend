import 'package:flutter/cupertino.dart';
import 'package:frontend/CryptoLensApp.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(
      const CryptoLensApp()
  );
}