import 'package:dio/dio.dart';
import 'package:dart_ping/dart_ping.dart';
import 'package:livecodingapp/features/jokes/data/models/jokes_model.dart';

import '../../../../core/error/exceptions.dart';

abstract class JokesRemoteDataSource {
  Future<JokesModel> getJokes();
}

class JokesRemoteDataSourceImpl extends JokesRemoteDataSource {
  final Dio dioClient;

  JokesRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<JokesModel> getJokes() async {
    String url = "https://api.chucknorris.io/jokes/random";

    try {
      final response = await dioClient.get(url);

      Map<String, dynamic> data = response.data;

      final ping = Ping(response.data["icon_url"], count: 5);

      ping.stream.listen((event) {
        if (event.response == null) {
          data["existIcon"] = false;
        } else {
          data["existIcon"] = true;
        }
      });

      if (data["existIcon"] == null) {
        data["existIcon"] = false;
      }

      return JokesModel.fromMap(data);
    } on DioError catch (e) {
      if (e.response != null) {
        throw ServerException();
      } else {
        throw ServerException();
      }
    }
  }
}
