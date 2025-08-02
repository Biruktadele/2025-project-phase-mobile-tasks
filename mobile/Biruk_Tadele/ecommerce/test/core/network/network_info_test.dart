import 'package:ecommerce/core/network/network.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Generate mocks
@GenerateMocks([InternetConnectionChecker])
import 'network_info_test.mocks.dart';

void main() {
  late NetworkInfoImpl networkInfo;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockInternetConnectionChecker);
  });

  group('isConnected', () {
    test(
      'should return true when there is an internet connection',
      () async {
        // arrange
        when(mockInternetConnectionChecker.hasConnection)
            .thenAnswer((_) async => true);
        
        // act
        final result = await networkInfo.isConnected;
        
        // assert
        expect(result, true);
        verify(mockInternetConnectionChecker.hasConnection).called(1);
      },
    );

    test(
      'should return false when there is no internet connection',
      () async {
        // arrange
        when(mockInternetConnectionChecker.hasConnection)
            .thenAnswer((_) async => false);
        
        // act
        final result = await networkInfo.isConnected;
        
        // assert
        expect(result, false);
        verify(mockInternetConnectionChecker.hasConnection).called(1);
      },
    );
  });
}
