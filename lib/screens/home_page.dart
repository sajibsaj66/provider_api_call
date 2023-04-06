import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../provider/data_provider_class.dart';

class ProviderDemoScreen extends StatefulWidget {
  const ProviderDemoScreen({Key? key}) : super(key: key);

  @override
  _ProviderDemoScreenState createState() => _ProviderDemoScreenState();
}

class _ProviderDemoScreenState extends State<ProviderDemoScreen> {
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<DataClass>(context, listen: false);
    postModel.getPostData();
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataClass>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Demo"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: postModel.loading
            ? Center(
                child: SpinKitThreeBounce(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: index.isEven ? Colors.red : Colors.green,
                      ),
                    );
                  },
                ),
              )
            : Center(
                child: Column(
                  children: List.generate(
                    postModel!.post!.length,
                    (index) => Column(
                      children: [
                        Column(
                          children: [
                            Text(
                              postModel.post?[index].name ?? "",
                            ),
                            Text(
                              postModel.post?[index].address!.geo!.lat ?? "",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ),
              ),
      ),
    );
  }
}
