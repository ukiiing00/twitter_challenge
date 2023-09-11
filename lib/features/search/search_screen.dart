import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_challenge/constants/sizes.dart';
import 'package:twitter_challenge/features/search/widgets/model_detail_view.dart';
import 'package:twitter_challenge/models/model.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  List<dynamic> listModel = List.generate(10, (index) => Model());
  late List<Map<String, Model>> listMap = List.generate(
      10, (index) => {"${listModel[index].title}": listModel[index]});

  @override
  Widget build(BuildContext context) {
    return SearchScreenDetail(
      listModel: listModel,
      listMap: listMap,
    );
  }
}

class SearchScreenDetail extends StatefulWidget {
  const SearchScreenDetail(
      {super.key, required this.listModel, required this.listMap});
  final List<dynamic> listModel;
  final List<Map<String, Model>> listMap;

  @override
  State<SearchScreenDetail> createState() => _SearchScreenDetailState();
}

class _SearchScreenDetailState extends State<SearchScreenDetail> {
  final TextEditingController _textEditingController = TextEditingController();
  late bool isContain = false;
  late String text = '';
  late dynamic model;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      text = _textEditingController.text;
      print(text);
      if (text.isNotEmpty) {
        for (var element in widget.listMap) {
          isContain = element.containsKey(text);
          if (isContain) {
            model = element;
            print(model);
            break;
          }
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          size.width,
          Sizes.size80 + Sizes.size4,
        ),
        child: AppBar(
          centerTitle: false,
          title: const Text(
            "Search",
            style: TextStyle(
              fontSize: Sizes.size28 + Sizes.size1,
              fontWeight: FontWeight.bold,
              letterSpacing: -1,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size(
              0,
              Sizes.size52,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: Sizes.size18,
                right: Sizes.size18,
                top: Sizes.size10,
              ),
              child: CupertinoSearchTextField(
                controller: _textEditingController,
              ),
            ),
          ),
        ),
      ),
      body: isContain
          ? ModelView(model: model[text])
          : ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: widget.listModel.length,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                color: Colors.grey.withOpacity(0.3),
                indent: 70,
              ),
              itemBuilder: (context, index) {
                return ModelView(model: widget.listModel[index]);
              },
            ),
    );
  }
}
