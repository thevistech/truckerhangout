import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/shimmer/advertisementList.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/stores/job_store.dart';
import 'package:flutterapp/stores/projects_store.dart';
import 'package:flutterapp/utills/config.dart';

class SliderWidget extends StatefulWidget {
  final DashBoardMainStore dashboardStore;
  final ProjectStore projectStore;
  final JobsStore jobStore;
  final callType;
  SliderWidget(
      {this.dashboardStore, this.projectStore, this.jobStore, this.callType});
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int _current = 0;
  var store;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  setStore() {
    switch (widget.callType) {
      case DASHBOARD:
        return dashboardSliderWidget();
      case PROJECTS:
        return projectSliderWidget();
        break;
      case JOBS:
        return jobSliderWidget();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return setStore();
  }

  dashboardSliderWidget() {
    return Container(
        margin: EdgeInsets.only(top: 5, bottom: 10),
        child: Column(
          children: <Widget>[
            widget.dashboardStore.isAdvertisementsLoaded
                ? CarouselSlider.builder(
                    itemCount: widget
                        .dashboardStore.advertisementsModel.data.data.length,
                    height: 190,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 2.0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                    onPageChanged: (index) {
                      setState(() {
                        _current = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      var bannerImage =
                          "${widget.dashboardStore.advertisementsModel.url}${widget.dashboardStore.advertisementsModel.data.data[index].banner}";
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                            child: Stack(children: <Widget>[
                              CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height: 1000,
                                  imageUrl: bannerImage,
                                  placeholder: (context, url) =>
                                      dummyCoverImage(context, true),
                                  errorWidget: (context, url, error) =>
                                      dummyCoverImage(context, false)),
                            ])),
                      );
                    },
                  )
                : shimmerAdvertisement(),
          ],
        ));
  }

  projectSliderWidget() {
    return Observer(
      builder: (_) => Container(
          margin: EdgeInsets.only(top: 5, bottom: 10),
          child: Column(
            children: <Widget>[
              widget.projectStore.isAdvertisementsLoaded
                  ? CarouselSlider.builder(
                      itemCount: widget
                          .projectStore.advertisementsModel.data.data.length,
                      height: 190,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      aspectRatio: 2.0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                      onPageChanged: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        var bannerImage =
                            "${widget.projectStore.advertisementsModel.url}${widget.projectStore.advertisementsModel.data.data[index].banner}";
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0)),
                              child: Stack(children: <Widget>[
                                CachedNetworkImage(
                                    height: 1000,
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                    imageUrl: bannerImage,
                                    placeholder: (context, url) =>
                                        dummyCoverImage(context, true),
                                    errorWidget: (context, url, error) =>
                                        dummyCoverImage(context, false)),
                              ])),
                        );
                      },
                    )
                  : shimmerAdvertisement(),
            ],
          )),
    );
  }

  jobSliderWidget() {
    return Observer(
      builder: (_) => Container(
          margin: EdgeInsets.only(top: 5, bottom: 10),
          child: Column(
            children: <Widget>[
              widget.jobStore.isAdvertisementsLoaded
                  ? CarouselSlider.builder(
                      itemCount:
                          widget.jobStore.advertisementsModel.data.data.length,
                      height: 190,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      aspectRatio: 2.0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                      onPageChanged: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        var bannerImage =
                            "${widget.jobStore.advertisementsModel.url}${widget.jobStore.advertisementsModel.data.data[index].banner}";
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0)),
                              child: Stack(children: <Widget>[
                                CachedNetworkImage(
                                    height: 1000,
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                    imageUrl: bannerImage,
                                    placeholder: (context, url) =>
                                        dummyCoverImage(context, true),
                                    errorWidget: (context, url, error) =>
                                        dummyCoverImage(context, false)),
                              ])),
                        );
                      },
                    )
                  : shimmerAdvertisement(),
            ],
          )),
    );
  }
}
