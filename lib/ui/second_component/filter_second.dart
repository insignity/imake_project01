import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterSecond extends StatefulWidget {
  @override
  _FilterSecondState createState() => _FilterSecondState();
}

class _FilterSecondState extends State<FilterSecond> {
  String provider = "";
  void initState() {
    clearFilter();
    super.initState();
  }

  var filterOnlyFreeWorkers = false;
  var filterTitle = 'Фильтр';
  var filterTitleController = TextEditingController();
  var filterLevel = 'Any level';

  var filterText = 'Фильтр';
  var filterHeight = 0.0;
  String switchText = "";

  filter() {
    setState(() {
      if (filterTitle.isNotEmpty) filterText += filterTitle + '/';

      if (provider == "Salon")
        filterText = filterOnlyFreeWorkers ? 'Свободные салоны' : 'Все салоны';
      else
        filterText =
            filterOnlyFreeWorkers ? 'Свободные исполнители' : 'Все исполнители';

      filterText += '/' + filterLevel;
      print(filterTitle);
      filterHeight = 0;
    });
  }

  clearFilter() {
    setState(() {
      filterText = 'Фильтр';
      filterOnlyFreeWorkers = false;
      filterTitle = 'Фильтр';
      filterLevel = 'Все услуги';
      filterTitleController.clear();
      filterHeight = 0;
    });
  }

  initFilter() {
    setState(() {
      if (provider == "Salon")
        switchText = "Показать только свободные салоны";
      else
        switchText = "Показать только свободных исполнителей";
      filterHeight = (filterHeight == 0.0 ? 280.0 : 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    provider = context.watch<String>();
    var filterInfo = Container(
        margin: EdgeInsets.only(top: 3, left: 7, right: 7, bottom: 5),
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
        height: 40,
        child: RaisedButton(
          child: Row(children: <Widget>[
            Icon(Icons.filter_list),
            Text(
              filterText,
              style: TextStyle(),
              overflow: TextOverflow.ellipsis,
            )
          ]),
          onPressed: () {
            initFilter();
          },
        ));
    var levelMenuItems = <String>['Все услуги', 'Волосы', 'Маникьюр', 'Макияж']
        .map((String value) {
      return new DropdownMenuItem<String>(
        value: value,
        child: new Text(value),
      );
    }).toList();
    var filterForm = AnimatedContainer(
      height: filterHeight,
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 7),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SwitchListTile(
                  title: Text(
                    switchText,
                    style: TextStyle(fontSize: 14),
                  ),
                  value: filterOnlyFreeWorkers,
                  onChanged: (bool val) =>
                      setState(() => filterOnlyFreeWorkers = val)),
              DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Виды услуг'),
                  items: levelMenuItems,
                  value: filterLevel,
                  onChanged: (String val) => setState(() => filterLevel = val)),
              TextFormField(
                controller: filterTitleController,
                decoration:
                    const InputDecoration(labelText: 'Поиск по видам услуг'),
                onChanged: (String val) => setState(() => filterTitle = val),
              ),
              SizedBox(height: 10),
              Row(children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      filter();
                    },
                    child:
                        Text("Принять", style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      clearFilter();
                    },
                    child:
                        Text("Очистить", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );

    return Column(children: <Widget>[
      filterInfo,
      filterForm,
    ]);
  }
}
