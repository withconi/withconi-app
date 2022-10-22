import '../../../import_basic.dart';

class PercentageGraph extends StatelessWidget {
  PercentageGraph({Key? key, required this.graphDataList, this.graphWidth})
      : super(key: key);

  List<PercentageGraphData> graphDataList;
  double? graphWidth;

  @override
  Widget build(BuildContext context) {
    bool singleValidValue = false;
    var noneZeroList =
        graphDataList.where((element) => element.percent > 0).toList();
    if (noneZeroList.length <= 1) {
      singleValidValue = true;
    }
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8.0),
      clipBehavior: Clip.antiAlias,
      child: Container(
          color: WcColors.grey60,
          width: graphWidth ?? WcWidth - 40,
          height: 22,
          child: Row(
            children: graphDataList.map((e) {
              return PercentageGraphData(
                graphColor: e.graphColor,
                percent: (e.percent > 0 && e.percent <= 10) ? 10 : e.percent,
                isLastIndex: ((graphDataList.indexOf(e) != 0 &&
                            noneZeroList.length > 1) ||
                        singleValidValue)
                    ? true
                    : false,
              );
            }).toList(),
          )),
    );
  }
}

class PercentageGraphData extends StatelessWidget {
  PercentageGraphData({
    Key? key,
    required this.graphColor,
    required this.percent,
    this.isLastIndex = false,
  }) : super(key: key);

  Color graphColor;
  int percent;
  bool isLastIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: percent,
      child: Container(
        decoration: BoxDecoration(
            color: graphColor,
            border: Border(
                right: BorderSide(
                    color: WcColors.white,
                    width: (isLastIndex || percent == 0) ? 0 : 3))),
      ),
    );
  }
}
