import 'package:flutter/material.dart';
import 'Cell/ContentCellViewModel.dart';
import 'ContentHome.dart';
import 'Header/HeaderHome.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  List<String> images = List();
  GlobalKey _keyColumnSize = GlobalKey();
  double heightColumn = 0;
  List<HomeContentCellViewModel> cellViewModels = List();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
    images = [
      "Assets/rectangle.png",
      "Assets/rectangle.png",
      "Assets/rectangle.png",
      "Assets/rectangle.png",
      "Assets/rectangle.png",
      "Assets/rectangle.png",
      "Assets/rectangle.png",
      "Assets/rectangle.png",
      "Assets/rectangle.png",
    ];

    cellViewModels = [
      HomeContentCellViewModel(
        "1",
        "イベントを選ぶ",
        """まずは参加したいイベントを選びましょう。
日時、場所で参加したいイベントを決めるのがおすすめです。""",
      ),
      HomeContentCellViewModel(
        "2",
        "お申込み",
        """参加したいイベントが決まったら申し込みをします。
申し込みはお電話、LINEで受け付けております。""",
      ),
      HomeContentCellViewModel(
        "3",
        "開催店舗で受付",
        """開始時間の30分前から受付開始です。
受付時にお名前とご年齢を確認させていただき、料金のお支払いをお願いします。
開始直前になると混み合う可能性がございます。""",
      ),
      HomeContentCellViewModel(
        "4",
        "イベント開催",
        """フリータイムなしで時間の許す限り、席替えを実施します。
ベテランスタッフによるスムーズな運営で素敵な出会いをサポートさせて頂きます。""",
      )
    ];
  }

  _getSizes() {
    final RenderBox renderBox =
        _keyColumnSize.currentContext.findRenderObject();
    final sizeRed = renderBox.size;
    heightColumn = sizeRed.height;
    print(heightColumn);
    setState(() {});
  }

  _afterLayout(_) {
    _getSizes();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('build Home');
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderHome(
                heightColumn: heightColumn,
                keyColumnSize: _keyColumnSize,
                images: images,
              ),
              Container(
                color: Color.fromRGBO(247, 247, 255, 1),
                height: 8,
              ),
              ContentHome(cellViewModels: cellViewModels),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
