import 'package:flutter/material.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    initDynamicLinks(context);
  }

  void initDynamicLinks(context) async {
    FirebaseDynamicLinks.instance.onLink
        .listen((PendingDynamicLinkData? dynamicLinkData) async {
      final Uri? deepLink = dynamicLinkData?.link;

      if (deepLink != null) {
        Navigator.pushNamed(context, deepLink.queryParameters.values.first);
        //Get.toNamed(deepLink.queryParameters.values.first);
      }
    }).onError((error) {
      print(error.message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: const Center(
        child: SizedBox(
          child: Text(
            'Deeplinking App',
          ),
        ),
      ),
    );
  }
}
