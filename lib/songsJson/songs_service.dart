import 'package:chopper/chopper.dart';
import 'package:flutter_application_2/songsJson/songs_model.dart';
import 'model_converter.dart';
part 'songs_service.chopper.dart';

@ChopperApi()
abstract class SongService extends ChopperService {
  @Get()
  Future<Response<SongsJson>> getSongs();

  static SongService create() {
    final client = ChopperClient(
      baseUrl: 'https://run.mocky.io/v3/9425ee93-302f-4c5a-a760-8585c988b0aa',
      converter: ModelConverter(),
      errorConverter: const JsonConverter(),
      services: [
        _$SongService(),
      ],
    );
    return _$SongService(client);
  }
}
