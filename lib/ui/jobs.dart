import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterapp/shimmer/postListView.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/stores/job_store.dart';
import 'package:flutterapp/ui/components/slider_widget.dart';
import 'package:flutterapp/ui/googleMapClustering/googleMap.dart';
import 'package:flutterapp/ui/googleMapClustering/googleMapForJobs.dart';
import 'package:flutterapp/ui/posts_widget.dart';
import 'package:flutterapp/utills/config.dart';

class JobsUI extends StatefulWidget {
  final JobsStore jobsStore;
  final DashBoardMainStore dashBoardMainStore;
  var currentUserImage;
  JobsUI(
      {@required this.jobsStore,
      this.currentUserImage,
      this.dashBoardMainStore});
  @override
  _JobsUIState createState() => _JobsUIState();
}

class _JobsUIState extends State<JobsUI> {
  double _lastFeedScrollOffset = 0;
  ScrollController scrollController;
  int pageno;

  @override
  void initState() {
    scrollController =
        ScrollController(initialScrollOffset: _lastFeedScrollOffset);
    pageno = 1;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!widget.jobsStore.isJobsListLoaded)
        widget.jobsStore.getJobsList(context, pageno);
      if (!widget.jobsStore.isAdvertisementsLoaded)
        widget.jobsStore.getAdvertisement(context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Observer(
        builder: (_) => visibilityListAndMapPage(
            widget.dashBoardMainStore.isMapVisible, height));
  }

  showPostData(height) {
    return widget.jobsStore.isJobsListLoaded
        ? ListView.builder(
            itemBuilder: (ctx, i) {
              if (i == 0) {
                return SliderWidget(
                  callType: JOBS,
                  jobStore: widget.jobsStore,
                );
              }
              return PostWidget(widget.jobsStore.jobsModel.data[i],
                  widget.jobsStore.jobsModel.url, widget.currentUserImage);
            },
            itemCount: widget.jobsStore.jobsModel.data.length,
            controller: scrollController,
          )
        : shimmerPost(context);
  }

  visibilityListAndMapPage(isVisible, height) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
            child: IndexedStack(
          index: !isVisible ? 0 : 1,
          children: <Widget>[
            showPostData(height),
            widget.jobsStore.items != null
                ? MapJob(
                    jobsModel: widget.jobsStore.jobsModel,
                    items: widget.jobsStore.items,
                  )
                : Container(
                    width: double.infinity,
                    height: double.infinity,
                  ),
          ],
        )),
      ],
    );
  }
}
