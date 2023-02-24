
import '../theme/icon_enum.dart';
import '../util/enum.dart';

class GenericItem {
  String id;
  String title;
  String? subTitle;
  String? image;
  ThemeIcon? icon;
  RecordType? recordType;
  bool? isSelected;

  GenericItem({
    required this.id,
    required this.title,
    this.image,
    this.subTitle,
    this.icon,
    this.recordType,
    this.isSelected,
  });
}