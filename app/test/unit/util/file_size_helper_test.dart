import 'package:localsend_app/util/file_size_helper.dart';
import 'package:test/test.dart';

void main() {
  group('asReadableFileSize', () {
    test('shows bytes for values less than 1000', () {
      expect(0.asReadableFileSize, '0 B');
      expect(1.asReadableFileSize, '1 B');
      expect(100.asReadableFileSize, '100 B');
      expect(999.asReadableFileSize, '999 B');
    });

    test('shows KB for values between 1000 and 999999 (less than 1MB)', () {
      expect(1000.asReadableFileSize, '1.0 KB');
      expect(1500.asReadableFileSize, '1.5 KB');
      expect(10000.asReadableFileSize, '10.0 KB');
      expect(100000.asReadableFileSize, '100.0 KB');
      expect(999999.asReadableFileSize, '1000.0 KB');
    });

    test('shows MB for values between 1000000 and 999999999 (less than 1GB)', () {
      expect(1000000.asReadableFileSize, '1.0 MB');
      expect(1500000.asReadableFileSize, '1.5 MB');
      expect(10000000.asReadableFileSize, '10.0 MB');
      expect(100000000.asReadableFileSize, '100.0 MB');
      expect(999999999.asReadableFileSize, '1000.0 MB');
    });

    test('shows GB for values 1000000000 or more', () {
      expect(1000000000.asReadableFileSize, '1.0 GB');
      expect(1500000000.asReadableFileSize, '1.5 GB');
      expect(10000000000.asReadableFileSize, '10.0 GB');
      expect(100000000000.asReadableFileSize, '100.0 GB');
    });

    test('formats decimal places correctly', () {
      expect(1234.asReadableFileSize, '1.2 KB');
      expect(1567.asReadableFileSize, '1.6 KB');
      expect(1234567.asReadableFileSize, '1.2 MB');
      expect(1567890.asReadableFileSize, '1.6 MB');
      expect(1234567890.asReadableFileSize, '1.2 GB');
      expect(1567890123.asReadableFileSize, '1.6 GB');
    });

    test('real-world file sizes match expected values', () {
      // 1 GB file should show as 1.0 GB, not 0.9 GB as it would with binary
      expect(1000000000.asReadableFileSize, '1.0 GB');
      
      // 1 GiB (1073741824 bytes) should show as approximately 1.1 GB with decimal
      expect(1073741824.asReadableFileSize, '1.1 GB');
      
      // 10 GB file
      expect(10000000000.asReadableFileSize, '10.0 GB');
      
      // Common file sizes
      expect(4700000000.asReadableFileSize, '4.7 GB'); // DVD-sized file
      expect(25000000000.asReadableFileSize, '25.0 GB'); // Blu-ray-sized file
    });
  });
}
