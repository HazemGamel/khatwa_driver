import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../../../core/services/cache_storage_services.dart';
import '../../../../../core/contants/api.dart';


class VerifyDriverPhoneAddressRepo {
  Future<Either<String, String>> driverVerifyPhoneCode(
      String phone, String verificationCode) async {
    try {
      final response = await http.post(
        verifyDriverEmailCodeUrl,
        body:
            jsonEncode(
                {'phone': phone,
                  'code': verificationCode}),
        headers: authHeaders,
      );
      final result = jsonDecode(response.body);
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        await CacheStorageServices().setToken(result['token']);
        await CacheStorageServices().setId(result['driver']['_id']);
        return Right(result['message']);
      } else {
        return Left(result['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> clientResendPhoneCode(String phone) async {
    try {
      final response = await http.post(
        verifyClientResendEmailCodeUrl,
        body: jsonEncode({'phone': phone}),
        headers: authHeaders,
      );
      final result = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(result['message']);
      } else {
        return Left(result['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
