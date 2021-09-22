// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songs_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$SongService extends SongService {
  _$SongService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = SongService;

  @override
  Future<Response<SongsJson>> getSongs() {
    final $url = '';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<SongsJson, SongsJson>($request);
  }
}
