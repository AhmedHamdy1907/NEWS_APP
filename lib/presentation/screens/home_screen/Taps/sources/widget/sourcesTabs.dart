import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_apps/presentation/screens/home_screen/Taps/sources/widget/sourceWidget.dart';
import '../../../../../../data/model/SourcesResponse/Sources.dart';
import '../../articles/View/articelsView.dart';
class SourcesTabs extends StatefulWidget {
  List<Source> sources;
  SourcesTabs({super.key, required this.sources});
  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}
class _SourcesTabsState extends State<SourcesTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TabBar(
                tabAlignment: TabAlignment.start,
                labelPadding: REdgeInsets.all(8),
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                isScrollable: true,
                tabs: widget.sources.map((source) {
                  return SourceWidget(
                    source: source,
                    isSelected: widget.sources.indexOf(source) == selectedIndex,
                  );
                }).toList()),
          ),
        ),
        ArticelsView(source: widget.sources[selectedIndex])
      ],
    );
  }
}
