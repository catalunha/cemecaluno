import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class InitBack4app {
  InitBack4app() {
    // init();
  }

  Future<bool> init() async {
    const keyParseServerUrl = 'https://parseapi.back4app.com';
    const keyApplicationId = '';
    const keyClientKey = '';
    const keyLiveQueryUrl = 'https://cemecaluno.b4a.io';
    await Parse().initialize(
      keyApplicationId,
      keyParseServerUrl,
      clientKey: keyClientKey,
      liveQueryUrl: keyLiveQueryUrl,
      autoSendSessionId: true,
      debug: true,
    );
    return (await Parse().healthCheck()).success;
  }
}
