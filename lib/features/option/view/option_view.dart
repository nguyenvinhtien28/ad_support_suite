import 'dart:math';

import 'package:ad_support_suite/core/utils/app_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/const/constans.dart';
import '../../../theme/app_theme.dart';

class OptionView extends StatefulWidget {
  const OptionView({Key? key}) : super(key: key);

  @override
  State<OptionView> createState() => _OptionViewState();
}

class _OptionViewState extends State<OptionView> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 100.w,
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultExThinPadding),
              margin: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultExThinPadding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: colorWhite),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Results",
                    style: typoBold16,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Paid reach",
                    style: typoRegular16,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "40.000 ",
                      style: typoBold18.copyWith(color: colorBlack),
                      children: <TextSpan>[
                        TextSpan(
                          text: "24%",
                          style: typoLight14.copyWith(color: colorGreen),
                        ),
                      ],
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 1.7,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                        color: colorWhite,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 18,
                          left: 12,
                          top: 24,
                          bottom: 12,
                        ),
                        child: LineChart(
                          showAvg ? avgData() : mainData(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Facebook Page reach",
                    style: typoRegular16,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "0 ",
                      style: typoBold18.copyWith(color: colorBlack),
                      children: <TextSpan>[
                        TextSpan(
                          text: "0%",
                          style: typoLight14.copyWith(color: colorGreen),
                        ),
                      ],
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 1.7,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                        color: colorWhite,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 18,
                          left: 12,
                          top: 24,
                          bottom: 12,
                        ),
                        child: LineChart(
                          avgData() ,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Instagram reach",
                    style: typoRegular16,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "4000 ",
                      style: typoBold18.copyWith(color: colorBlack),
                      children: <TextSpan>[
                        TextSpan(
                          text: "24%",
                          style: typoLight14.copyWith(color: colorGreen),
                        ),
                      ],
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 1.7,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                        color: colorWhite,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 18,
                          left: 12,
                          top: 24,
                          bottom: 12,
                        ),
                        child: LineChart(
                          showAvg ? avgData() : mainData(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    var rng = Random();
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, rng.nextDouble()+rng.nextInt(5)),
            FlSpot(2.6, rng.nextDouble()+rng.nextInt(5)),
            FlSpot(4.9, rng.nextDouble()+rng.nextInt(5)),
            FlSpot(6.8, rng.nextDouble()+rng.nextInt(5)),
            FlSpot(8, rng.nextDouble()+rng.nextInt(5)),
            FlSpot(9.5, rng.nextDouble()+rng.nextInt(5)),
            FlSpot(11, rng.nextDouble()+rng.nextInt(5)),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 0),
            FlSpot(2.6, 0),
            FlSpot(4.9, 0),
            FlSpot(6.8, 0),
            FlSpot(8, 0),
            FlSpot(9.5, 0),
            FlSpot(11, 0),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
