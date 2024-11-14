import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  final String name;
  final double width;
  final double height;
  final Color color;

  const SvgIcon(
    this.name, {
    super.key,
    this.width = 30,
    this.height = 30,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    if (name.isEmpty) {
      throw FlutterError('Invalid SVG icon name: $name');
    }
    return SvgPicture.asset(
      name,
      width: width,
      height: height,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}

class SvgIcons {
  static const String billList = 'assets/svg/solar_bill-list-linear.svg';
  static const String hamburgerMenu =
      'assets/svg/solar_hamburger-menu-linear.svg';
  static const String calendarMark =
      'assets/svg/solar_calendar-mark-linear.svg';
  static const String cardTransfer =
      'assets/svg/solar_card-transfer-linear.svg';
  static const String cart = 'assets/svg/solar_cart-3-linear.svg';
  static const String chart = 'assets/svg/solar_chart-linear.svg';
  static const String confetti =
      'assets/svg/solar_confetti-minimalistic-linear.svg';
  static const String diagramUp = 'assets/svg/solar_diagram-up-linear.svg';
  static const String dollar =
      'assets/svg/solar_dollar-minimalistic-linear.svg';
  static const String graphUp = 'assets/svg/solar_graph-up-linear.svg';
  static const String home = 'assets/svg/solar_home-2-linear.svg';
  static const String listArrowDown =
      'assets/svg/solar_list-arrow-down-minimalistic-linear.svg';
  static const String pieChart = 'assets/svg/solar_pie-chart-3-linear.svg';
  static const String presentationGraph =
      'assets/svg/solar_presentation-graph-linear.svg';
  static const String qrCode = 'assets/svg/solar_qr-code-linear.svg';
  static const String refresh = 'assets/svg/solar_refresh-linear.svg';
  static const String roundGraph = 'assets/svg/solar_round-graph-linear.svg';
  static const String settings = 'assets/svg/solar_settings-linear.svg';
  static const String shieldKeyhole =
      'assets/svg/solar_shield-keyhole-minimalistic-linear.svg';
  static const String sort = 'assets/svg/solar_sort-linear.svg';
  static const String trashBin =
      'assets/svg/solar_trash-bin-minimalistic-linear.svg';
  static const String wallet = 'assets/svg/solar_wallet-linear.svg';
  static const String chartSquare = 'assets/svg/solar_chart-square-linear.svg';
  static const String addCircle = 'assets/svg/solar_add-circle-broken.svg';
  static const String checkCircle = 'assets/svg/solar_check-circle-linear.svg';
  static const String closeCircle = 'assets/svg/solar_close-circle-linear.svg';

  // Bold versions
  static const String billListBold = 'assets/svg/solar_bill-list-bold.svg';
  static const String cardTransferBold =
      'assets/svg/solar_card-transfer-bold.svg';
  static const String cartBold = 'assets/svg/solar_cart-3-bold.svg';
  static const String confettiBold =
      'assets/svg/solar_confetti-minimalistic-bold.svg';
  static const String dollarBold =
      'assets/svg/solar_dollar-minimalistic-bold.svg';
  static const String graphUpBold = 'assets/svg/solar_graph-up-bold.svg';
  static const String homeBold = 'assets/svg/solar_home-2-bold.svg';
  static const String pieChartBold = 'assets/svg/solar_pie-chart-3-bold.svg';
  static const String presentationGraphBold =
      'assets/svg/solar_presentation-graph-bold.svg';
  static const String settingsBold = 'assets/svg/solar_settings-bold.svg';
  static const String shieldKeyholeBold =
      'assets/svg/solar_shield-keyhole-minimalistic-bold.svg';
  static const String trashBinBold =
      'assets/svg/solar_trash-bin-minimalistic-bold.svg';
  static const String walletBold = 'assets/svg/solar_wallet-bold.svg';
  static const String chartSquareBold =
      'assets/svg/solar_chart-square-bold.svg';
}
