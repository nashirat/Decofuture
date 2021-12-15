import 'package:equatable/equatable.dart';

class CustomBanner extends Equatable {
  final String name;
  final String imagePath;

  const CustomBanner({
    required this.name,
    required this.imagePath,
  });

  @override
  List<Object?> get props => [
        name,
        imagePath,
      ];

  static List<CustomBanner> cBanners = [
    const CustomBanner(
      name: 'banner1',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/artest-87cb3.appspot.com/o/banners%2Fbanner1.png?alt=media&token=9db6b187-8dbf-4771-9d1c-3b2915736607',
    ),
    const CustomBanner(
      name: 'banner2',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/artest-87cb3.appspot.com/o/banners%2Fbanner2.png?alt=media&token=a94c96f9-2ad2-4a52-bb38-680aa049c080',
    ),
    const CustomBanner(
      name: 'banner3',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/artest-87cb3.appspot.com/o/banners%2Fbanner3.png?alt=media&token=3ad920fd-8ac2-40b2-b9af-67cf82c97109',
    ),
  ];
}
