import 'package:bettertwitter/models/user/user_model.dart';
import 'package:bettertwitter/screens/authentication/repository/auth_repository.dart';
import 'package:bettertwitter/services/auth_service.dart';
import 'package:bettertwitter/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks([AuthService, DbService])
void main() {
  late MockAuthService mockAuthService;
  late MockDbService mockDbService;

  late AuthRepository sut;

  setUp(() {
    mockAuthService = MockAuthService();
    mockDbService = MockDbService();
    sut =
        AuthRepository(authService: mockAuthService, dbService: mockDbService);
  });

  group("Auth repository: ", () {
    test("checking login function", () async {
      when(mockAuthService.signInWithEmailAndPassword('email', 'password'))
          .thenAnswer((realInvocation) async => null);
      final result = await sut.login("email", "password");
      expect(result, true);
    });
    test("checking Sign up function", () async {
      when(mockAuthService.signUpWithEmailAndPassword('email', 'password'))
          .thenAnswer((realInvocation) async => null);
      when(mockDbService.addDataToCollection(
              collectionName: 'users',
              data: UserModel(
                name: "name",
                email: "email",
                password: "password",
                image: 1.toString(),
              ).toJson()))
          .thenAnswer((realInvocation) async => true);
      final result = await sut.signup("email", "password", "name");
      expect(result, true);
    });
  });
}
