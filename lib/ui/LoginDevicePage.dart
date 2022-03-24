import 'dart:io';

import 'package:daily_yoga_h2/base/YogaColors.dart';
import 'package:daily_yoga_h2/base/YogaStrings.dart';
import 'package:daily_yoga_h2/model/DeviceInfo.dart';
import 'package:daily_yoga_h2/widget/ClickableText.dart';
import 'package:daily_yoga_h2/widget/YogaAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginDevicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: YogaStrings.loginDeviceManager,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: DeviceManagerScaffold(),
    );
  }
}

class DeviceManagerScaffold extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EditState();
  }
}

class _EditState extends State<StatefulWidget> {
  bool editState = false;
  List<DeviceInfo> data = [];

  void _editor() {
    setState(() {
      editState = !editState;
      print("$editState");
    });
  }

  void _finishPage() {
    // SystemNavigator.pop();
    exit(0);
  }

  void _initData() {
    DeviceInfo info = DeviceInfo();
    info.phoneName = '甲的手机';
    info.deviceName = '小米10';
    info.time = 1647330762;
    data.add(info);
  }

  @override
  Widget build(BuildContext context) {
    _initData();
    return Scaffold(
      appBar: YogaAppBar(
        YogaStrings.loginDeviceManager,
        () => _finishPage(),
        YogaStrings.edit,
        () => _editor(),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DescDisplay(),
          DeviceListDisplay(editState, data),
        ],
      ),
    );
  }
}

class DescDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      alignment: Alignment.center,
      child: ClickableText(
        YogaStrings.loginDeviceManagerDesc,
        color: YogaColors.ffF6F3EF,
        style: TextStyle(fontSize: 12, color: YogaColors.ffB0875C),
        paddingInfo: EdgeInsets.only(left: 16, right: 16),
      ),
    );
  }
}

class DeviceListDisplay extends StatelessWidget {
  final bool editState;
  final List<DeviceInfo> data;

  DeviceListDisplay(this.editState, this.data);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length, shrinkWrap: true, itemBuilder: _itemBuilder);
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return _getListItemWidget(data[index]);
  }

  _getListItemWidget(DeviceInfo info) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      height: 66,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClickableText(
              info.phoneName,
              gravity: Alignment.centerLeft,
              color: Colors.white,
              style: TextStyle(
                fontSize: 14,
                color: YogaColors.ff2E2F33,
              ),
              paddingInfo: EdgeInsets.only(left: 16, right: 16),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClickableText(
                    info.deviceName,
                    color: Colors.white,
                    style: TextStyle(
                      fontSize: 12,
                      color: YogaColors.ff8A8D99,
                    ),
                    paddingInfo: EdgeInsets.only(left: 16, right: 16),
                  ),
                  ClickableText("${info.time}",
                      color: Colors.white,
                      style: TextStyle(
                        fontSize: 12,
                        color: YogaColors.ff8A8D99,
                      ),
                      paddingInfo: EdgeInsets.only(right: 16)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
