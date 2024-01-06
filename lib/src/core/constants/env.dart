import 'package:envied/envied.dart';

part 'generated/env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'endpoint', defaultValue: 'http://localhost:3001')
  static const String endpoint = _Env.endpoint;
}
