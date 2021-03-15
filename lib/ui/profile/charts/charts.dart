import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Charts extends StatefulWidget {
  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  List<charts.Series<Stairs, String>> _seriesData;

  List<charts.Series<Task, String>> _seriesPieData;

  List<charts.Series<Sales, int>> _seriesLineData;

  _generateData() {
    var data1 = [
      Stairs('Январь', 'Вадим', 4),
      Stairs('Январь', 'Виктория', 6),
      Stairs('Январь', 'Анна', 5),
    ];
    var data2 = [
      Stairs('Январь', 'Вадим', 10),
      Stairs('Январь', 'Виктория', 22),
      Stairs('Январь', 'Анна', 17),
    ];
    var data3 = [
      Stairs('Январь', 'Вадим', 25),
      Stairs('Январь', 'Виктория', 72),
      Stairs('Январь', 'Анна', 50),
    ];

    var piedata = [
      Task('Дети до 15', 10.2, Color(0xffff9900)),
      Task('Девушки от 16 до 24', 21.3, Color(0xff990099)),
      Task('Женщины от 25 до 35', 25.8, Color(0xff3366cc)),
      Task('Женщины от 36', 20.1, Color(0xff109618)),
      Task('Парни от 16 до 24', 15.6, Color(0xfffdbe19)),
      Task('Мужщины от 25 до 35', 23.3, Color(0xffdc3912)),
      Task('Мужщины от 36', 18.2, Color(0xff004499)),
    ];

    var linesalesdata = [
      Sales(0, 25),
      Sales(1, 30),
      Sales(2, 32),
      Sales(3, 34),
      Sales(4, 32),
      Sales(5, 40),
    ];
    var linesalesdata1 = [
      Sales(0, 31),
      Sales(1, 35),
      Sales(2, 32),
      Sales(3, 40),
      Sales(4, 44),
      Sales(5, 43),
    ];
    var linesalesdata2 = [
      Sales(0, 20),
      Sales(1, 24),
      Sales(2, 35),
      Sales(3, 30),
      Sales(4, 25),
      Sales(5, 30),
    ];
    var lineIncome = [
      Sales(0, 120),
      Sales(1, 130),
      Sales(2, 134),
      Sales(3, 145),
      Sales(4, 137),
      Sales(5, 146),
    ];

    _seriesData.add(
      charts.Series(
        seriesColor: charts.MaterialPalette.red.shadeDefault,
        domainFn: (Stairs pollution, _) => pollution.worker,
        measureFn: (Stairs pollution, _) => pollution.quantity,
        id: 'Минимум',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Stairs pollution, _) =>
            charts.ColorUtil.fromDartColor(Colors.red),
      ),
    );

    _seriesData.add(
      charts.Series(
        seriesColor: charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Stairs pollution, _) => pollution.worker,
        measureFn: (Stairs pollution, _) => pollution.quantity,
        id: 'В среднем',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Stairs pollution, _) =>
            charts.ColorUtil.fromDartColor(Colors.blue),
      ),
    );

    _seriesData.add(
      charts.Series(
        seriesColor: charts.MaterialPalette.green.shadeDefault,
        domainFn: (Stairs pollution, _) => pollution.worker,
        measureFn: (Stairs pollution, _) => pollution.quantity,
        id: 'Максимум',
        data: data3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Stairs pollution, _) =>
            charts.ColorUtil.fromDartColor(Colors.green),
      ),
    );

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );

    _seriesLineData.add(
      charts.Series(
        seriesColor: charts.MaterialPalette.blue.shadeDefault,
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.blue),
        id: 'Выручка Анны',
        data: linesalesdata,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        seriesColor: charts.MaterialPalette.purple.shadeDefault,
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.purple),
        id: 'Выручка Виктории',
        data: linesalesdata1,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        seriesColor: charts.MaterialPalette.yellow.shadeDefault,
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.yellow),
        id: 'Выручка Вадима',
        data: linesalesdata2,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        seriesColor: charts.MaterialPalette.green.shadeDefault,
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.green),
        id: 'Выручка салона',
        data: lineIncome,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesData = <charts.Series<Stairs, String>>[];
    _seriesPieData = <charts.Series<Task, String>>[];
    _seriesLineData = <charts.Series<Sales, int>>[];
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 510,
        color: Theme.of(context).primaryColor,
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              flexibleSpace: SafeArea(
                  child: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.bar_chart)),
                  Tab(icon: Icon(Icons.pie_chart)),
                  Tab(icon: Icon(Icons.line_style)),
                ],
              )),
            ),
            body: TabBarView(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Среднее количество принятых клиентов за день',
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: charts.BarChart(
                              _seriesData,
                              animate: true,
                              selectionModels: [],
                              primaryMeasureAxis: charts.NumericAxisSpec(
                                  tickProviderSpec:
                                      charts.BasicNumericTickProviderSpec(
                                          zeroBound: false)),
                              barGroupingType: charts.BarGroupingType.grouped,
                              behaviors: [
                                charts.SeriesLegend(
                                  horizontalFirst: false,
                                  cellPadding:
                                      EdgeInsets.only(right: 4.0, bottom: 4.0),
                                  position: charts.BehaviorPosition.top,
                                  outsideJustification:
                                      charts.OutsideJustification.endDrawArea,
                                )
                              ],
                              animationDuration: Duration(milliseconds: 300),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Разбиение по возрасту посетителей',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Expanded(
                            child: charts.PieChart(_seriesPieData,
                                animate: true,
                                animationDuration: Duration(milliseconds: 500),
                                behaviors: [
                                  charts.DatumLegend(
                                    position: charts.BehaviorPosition.top,
                                    outsideJustification:
                                        charts.OutsideJustification.end,
                                    horizontalFirst: false,
                                    desiredMaxRows: 7,
                                    cellPadding: EdgeInsets.only(
                                        right: 4.0, bottom: 4.0),
                                    entryTextStyle: charts.TextStyleSpec(
                                        color: charts.MaterialPalette.black,
                                        fontSize: 14),
                                  )
                                ],
                                defaultRenderer: charts.ArcRendererConfig(
                                    arcWidth: 150,
                                    arcRendererDecorators: [
                                      charts.ArcLabelDecorator(
                                          insideLabelStyleSpec:
                                              charts.TextStyleSpec(
                                                  color: charts
                                                      .MaterialPalette.white,
                                                  fontSize: 14),
                                          labelPosition:
                                              charts.ArcLabelPosition.outside)
                                    ])),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Выручка и зарплата работников',
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: charts.LineChart(
                              _seriesLineData,
                              defaultRenderer: charts.LineRendererConfig(
                                  includeArea: true, stacked: true),
                              animate: true,
                              animationDuration: Duration(milliseconds: 500),
                              primaryMeasureAxis: charts.NumericAxisSpec(
                                  tickProviderSpec:
                                      charts.BasicNumericTickProviderSpec(
                                          zeroBound: false)),
                              behaviors: [
                                charts.SeriesLegend(
                                  entryTextStyle: charts.TextStyleSpec(
                                      color: charts.MaterialPalette.black,
                                      fontSize: 16),
                                  horizontalFirst: false,
                                  cellPadding:
                                      EdgeInsets.only(right: 4.0, bottom: 4.0),
                                  position: charts.BehaviorPosition.top,
                                  outsideJustification:
                                      charts.OutsideJustification.endDrawArea,
                                ),
                                charts.ChartTitle('Месяца',
                                    behaviorPosition:
                                        charts.BehaviorPosition.bottom,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                charts.ChartTitle('Выручка в тыс. руб.',
                                    behaviorPosition:
                                        charts.BehaviorPosition.start,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                              ],
                              selectionModels: [
                                charts.SelectionModelConfig(changedListener:
                                    (charts.SelectionModel model) {
                                  if (model.hasDatumSelection)
                                    print(model.selectedSeries[0].measureFn(
                                        model.selectedDatum[0].index));
                                })
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Stairs {
  String month;
  String worker;
  int quantity;

  Stairs(this.month, this.worker, this.quantity);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class Sales {
  int yearval;
  int salesval;

  Sales(this.yearval, this.salesval);
}
