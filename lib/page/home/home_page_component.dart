import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:wallet_paper_main/model/category_model.dart';
import 'package:wallet_paper_main/model/paper_item_model.dart';
import 'package:wallet_paper_main/page/home/home_page_big.dart';
import 'package:wallet_paper_main/provider/data_provider.dart';

class HomePageContentWidget extends StatefulWidget {
  const HomePageContentWidget({Key? key, required this.cateModel})
      : super(key: key);
  final CategoryModel cateModel;

  @override
  State<HomePageContentWidget> createState() => _HomePageContentWidgetState();
}

class _HomePageContentWidgetState extends State<HomePageContentWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List<PaperItemModel> list = [];
  int page = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _load();
  }

  void _load() async {
    _requestNewsItem();
  }

  void _loadMore() async {
    page += 1;
    _requestNewsItem();
  }

  void _requestNewsItem() async {
    List<PaperItemModel> tempList =
        await DataProvider().getPaperItemModels(widget.cateModel.id!, 0);
    setState(() {
      if (page == 0) {
        list = tempList;
      } else {
        list += tempList;
      }
    });
  }

  void _showFullScreenImage(String imageUrl, String tag) {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        pageBuilder: (BuildContext context, _, __) {
          return HomePageBig(tag: tag, bigimageurl: imageUrl);
           
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {},
        child: Scaffold(
          body: EasyRefresh(
              onLoad: () async {
                _load();
              },
              onRefresh: () async {
                _loadMore();
              },
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 9 / 16,
                  ),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final paperModel = list[index];
                    return Padding(
                        padding:
                            const EdgeInsets.only(left: 10.0, bottom: 10.0),
                        child: SizedBox(
                          height: 80,
                          child: InkWell(
                              onTap: () {
                                _showFullScreenImage(
                                    paperModel.img12801024!, paperModel.id!);
                              },
                              child: AspectRatio(
                                aspectRatio: 9 / 16,
                                child: Card(
                                    elevation: 2,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Hero(
                                      tag: paperModel.id!,
                                      child: paperModel.img1024768 != null
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.network(
                                                paperModel.img1024768!,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                    )),
                              )),
                        ));
                  })),
        ));
  }
}
