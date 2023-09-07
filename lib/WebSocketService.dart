import 'package:web_socket_channel/io.dart';

class WebSocketService {
  final channel = IOWebSocketChannel.connect(
      'wss://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/gs-guide-websocket/app/hello');

  void sendMessage(String message) {
    channel.sink.add(message);
  }

  Stream<dynamic> get messages => channel.stream;

  void dispose() {
    channel.sink.close();
  }
}
