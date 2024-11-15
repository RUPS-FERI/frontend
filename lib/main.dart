import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/CryptoLensApp.dart';
import 'package:provider/provider.dart';

import '_common/bloc/coin/list/coin-list.bloc.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(MultiProvider(
    providers: [
      BlocProvider(create: (_) => CoinListBloc()),
    ],
    child: const CryptoLensApp(),
  ));
}
