
import 'package:flutter/material.dart';
import 'package:wallet_paper_main/model/category_model.dart';
import 'package:wallet_paper_main/model/paper_item_model.dart';
import 'package:wallet_paper_main/page/home/home_page_big.dart';
import 'package:wallet_paper_main/provider/data_provider.dart';
import 'package:wallet_paper_main/utils/text_style.dart';

class AllPageComponent extends StatefulWidget {
  const AllPageComponent({Key? key, required this.cateModel}) : super(key: key);
  final CategoryModel cateModel;
  @override
  State<AllPageComponent> createState() => _AllPageComponentState();
}

class _AllPageComponentState extends State<AllPageComponent> {
  List<PaperItemModel> list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _requestFirstPageData();
  }
  void _requestFirstPageData() async {
    List<PaperItemModel> tempList = await DataProvider().getPaperItemModels(widget.cateModel.id!, 0);
    setState(() {
      list = tempList;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          child: Padding(
          padding: const EdgeInsets.only(left: 16.0,top: 16.0),
          child:Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.cateModel.name!,
              style: MidSubTitleTextFeature.midSubTitleTextStyle,
            )
          ),
           ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0,top: 25.0),
          child: SizedBox(
      height: 196 ,
      child: ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,//用来限制listview的高度
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final item = list[index];
        return Padding(
          padding: const EdgeInsets.only(right: 25.0),
          child: InkWell(
            onTap: (){
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
          return HomePageBig(tag: item.id!, bigimageurl: item.img12801024!);
           
        },
      ),
    );
            },
            child: SizedBox(
              child: AspectRatio(
              aspectRatio: 196 / 293,
              child: Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(item.img1024768!,
                fit: BoxFit.cover)
                ),
              ),
            ),
            ),
          )
          
        );
        },
     )
       
          )) 
      ]
    );
  }
}