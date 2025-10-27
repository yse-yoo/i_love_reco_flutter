import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../api/auth_api.dart';

final authProvider = Provider((ref) => AuthApi());