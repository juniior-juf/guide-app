import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:guide_app/src/app/features/active/controllers/active_controller.dart';
import 'package:guide_app/src/app/util/date_util.dart';

class ActivePage extends StatefulWidget {
  const ActivePage({super.key});

  @override
  State<ActivePage> createState() => _ActivePageState();
}

class _ActivePageState extends State<ActivePage> {
  late final ActiveController _controller;

  List<Color> gradientColors = [
    Colors.cyan.shade900,
    Colors.teal,
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    _controller = Get.find<ActiveController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_controller.activeEntity.value.symbol ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 10,
          top: 48,
          bottom: 10,
        ),
        child: LineChart(mainData()),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: false,
      ),
      borderData: FlBorderData(show: false),
      minX: _controller.minX,
      maxX: _controller.maxX,
      minY: _controller.minY,
      maxY: _controller.maxY,
      lineBarsData: [
        LineChartBarData(
          spots: _buildListSpot,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 3,
          isStrokeCapRound: false,
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
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.cyan.shade900,
          getTooltipItems: _buildToolTip,
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 24,
            interval: 4,
            getTitlesWidget: _buildBotomTitle,
          ),
        ),
      ),
    );
  }

  List<FlSpot> get _buildListSpot {
    List<FlSpot> list = [];
    for (int index = 0; index < _controller.listData.length; index++) {
      list.add(FlSpot(
        index.toDouble(),
        _controller.listData[index].last,
      ));
    }
    return list;
  }

  List<LineTooltipItem> _buildToolTip(List<LineBarSpot> data) {
    return data.map((e) {
      final dateTimeStamp = _controller.listData[e.spotIndex].first;
      return LineTooltipItem(
        '${e.y} ${_controller.activeEntity.value.currency}',
        TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        children: [
          TextSpan(
            text: '  ${DateUtil.formatHour(dateTimeStamp)}',
          ),
        ],
      );
    }).toList();
  }

  Widget _buildBotomTitle(double value, TitleMeta meta) {
    if (value.toInt() < _controller.listData.length) {
      final date = DateUtil.formatHour(
        _controller.listData[value.toInt()].first,
      );
      return Text(
        '$date',
        style: TextStyle(fontSize: 16),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }
}
