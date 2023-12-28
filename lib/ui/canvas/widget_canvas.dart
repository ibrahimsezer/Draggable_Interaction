import 'dart:developer';
import 'dart:math' as math;
import 'package:draggable_example/providers/widget_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../../model/widget_model.dart';

class CanvasBackground extends StatefulWidget {
  const CanvasBackground({
    Key? key,
  }) : super(key: key);

  @override
  State<CanvasBackground> createState() => _CanvasBackgroundState();
}

class _CanvasBackgroundState extends State<CanvasBackground> {
  String getInfoText(param) {
    return 'Row ${param.yIndex}: Column ${param.xIndex}'
        '\nHorizontal : ${RenderTwoDimensionalGridViewport.horizontalGlobalPixels}'
        '\nVertical : ${RenderTwoDimensionalGridViewport.verticalGlobalPixels}'
        '\n viewW : ${RenderTwoDimensionalGridViewport.viewportW}'
        '\n viewH : ${RenderTwoDimensionalGridViewport.viewportH}'
        '\n MQ : ${MediaQuery.sizeOf(context).height}'
        '\n WidPos : ${WidgetModel.widgetModelList.toList()}';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WidgetProvider>(
      builder: (BuildContext context, WidgetProvider value, Widget? child) {
        return Stack(
          children: [
            TwoDimensionalGridView(
              diagonalDragBehavior: DiagonalDragBehavior.free,
              delegate: TwoDimensionalChildBuilderDelegate(
                  maxXIndex: 4,
                  maxYIndex: 3,
                  builder: (BuildContext context, ChildVicinity vicinity) {
                    return Container(
                      color: vicinity.xIndex.isEven && vicinity.yIndex.isEven
                          ? Colors.amber[50]
                          : (vicinity.xIndex.isOdd && vicinity.yIndex.isOdd
                              ? Colors.purple[50]
                              : null),
                      height: 200,
                      width: 200,
                      child: Center(child: Text(getInfoText(vicinity))),
                    );
                  }),
            ),
            ...WidgetModel.widgetModelList.map((e) => e.widget)
          ],
        );
      },
    );
  }
}

class TwoDimensionalGridView extends TwoDimensionalScrollView {
  const TwoDimensionalGridView({
    super.key,
    super.primary,
    super.mainAxis = Axis.vertical,
    super.verticalDetails = const ScrollableDetails.vertical(),
    super.horizontalDetails = const ScrollableDetails.horizontal(),
    required TwoDimensionalChildBuilderDelegate delegate,
    super.cacheExtent,
    super.diagonalDragBehavior = DiagonalDragBehavior.none,
    super.dragStartBehavior = DragStartBehavior.start,
    super.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    super.clipBehavior = Clip.hardEdge,
  }) : super(delegate: delegate);

  @override
  Widget buildViewport(
    BuildContext context,
    ViewportOffset verticalOffset,
    ViewportOffset horizontalOffset,
  ) {
    return TwoDimensionalGridViewport(
      horizontalOffset: horizontalOffset,
      horizontalAxisDirection: horizontalDetails.direction,
      verticalOffset: verticalOffset,
      verticalAxisDirection: verticalDetails.direction,
      mainAxis: mainAxis,
      delegate: delegate as TwoDimensionalChildBuilderDelegate,
      cacheExtent: cacheExtent,
      clipBehavior: clipBehavior,
    );
  }
}

class TwoDimensionalGridViewport extends TwoDimensionalViewport {
  const TwoDimensionalGridViewport({
    super.key,
    required super.verticalOffset,
    required super.verticalAxisDirection,
    required super.horizontalOffset,
    required super.horizontalAxisDirection,
    required TwoDimensionalChildBuilderDelegate super.delegate,
    required super.mainAxis,
    super.cacheExtent,
    super.clipBehavior = Clip.hardEdge,
  });

  @override
  RenderTwoDimensionalViewport createRenderObject(BuildContext context) {
    return RenderTwoDimensionalGridViewport(
      horizontalOffset: horizontalOffset,
      horizontalAxisDirection: horizontalAxisDirection,
      verticalOffset: verticalOffset,
      verticalAxisDirection: verticalAxisDirection,
      mainAxis: mainAxis,
      delegate: delegate as TwoDimensionalChildBuilderDelegate,
      childManager: context as TwoDimensionalChildManager,
      cacheExtent: cacheExtent,
      clipBehavior: clipBehavior,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderTwoDimensionalGridViewport renderObject,
  ) {
    renderObject
      ..horizontalOffset = horizontalOffset
      ..horizontalAxisDirection = horizontalAxisDirection
      ..verticalOffset = verticalOffset
      ..verticalAxisDirection = verticalAxisDirection
      ..mainAxis = mainAxis
      ..delegate = delegate
      ..cacheExtent = cacheExtent
      ..clipBehavior = clipBehavior;

    WidgetProvider().movingWidgetsWithCanvas(
        horizontalOffset.pixels,
        verticalOffset.pixels,
        RenderTwoDimensionalGridViewport.horizontalGlobalPixels,
        RenderTwoDimensionalGridViewport.verticalGlobalPixels);
  }
}

class RenderTwoDimensionalGridViewport extends RenderTwoDimensionalViewport {
  RenderTwoDimensionalGridViewport({
    required super.horizontalOffset,
    required super.horizontalAxisDirection,
    required super.verticalOffset,
    required super.verticalAxisDirection,
    required TwoDimensionalChildBuilderDelegate delegate,
    required super.mainAxis,
    required super.childManager,
    super.cacheExtent,
    super.clipBehavior = Clip.hardEdge,
  }) : super(delegate: delegate);

  static double gridX = 0.0;
  static double gridY = 0.0;
  static double horizontalGlobalPixels = 0.0;
  static double verticalGlobalPixels = 0.0;
  static double viewportW = 0.0;
  static double viewportH = 0.0;
  static double extentV = 0.0;
  static double extentH = 0.0;

  static double getCoordinate(axis) => axis;

  static List<double> getGridValues() {
    return [gridX, gridY];
  }

  @override
  void layoutChildSequence() {
    ///TR horizontalPixels ve verticalPixels, yatay ve dikey kaydırma değerlerini temsil eder.

    ///EN horizontalPixels and verticalPixels represent horizontal and vertical scroll values.
    final double horizontalPixels = horizontalOffset.pixels;
    final double verticalPixels = verticalOffset.pixels;

    ///TR viewportWidth ve viewportHeight, viewport'un genişlik ve yüksekliğini temsil eder. (Görünen Alan)

    ///EN viewportWidth and viewportHeight represent the width and height of the viewport.
    final double viewportWidth = viewportDimension.width + cacheExtent;
    final double viewportHeight = viewportDimension.height + cacheExtent;

    ///TR builderDelegate, TwoDimensionalChildBuilderDelegate türündeki bir delegeyi temsil eder.

    ///EN builderDelegate represents a delegate of type TwoDimensionalChildBuilderDelegate.
    final TwoDimensionalChildBuilderDelegate builderDelegate =
        delegate as TwoDimensionalChildBuilderDelegate;

    ///TR maxRowIndex ve maxColumnIndex, sırasıyla en büyük satır ve sütun indekslerini temsil eder.

    ///EN maxRowIndex and maxColumnIndex represent the largest row and column indexes, respectively.
    final int maxRowIndex = builderDelegate.maxYIndex!;
    final int maxColumnIndex = builderDelegate.maxXIndex!;

    ///TR leadingColumn, leadingRow, trailingColumn, ve trailingRow, görünen sütun ve
    /// satır aralıklarını hesaplar. Bu, kullanıcının mevcut kaydırma konumuna bağlı olarak görünen ızgarayı belirler.

    ///EN leadingColumn, leadingRow, trailingColumn, and trailingRow calculate visible
    /// column and row spacing. This determines the grid that appears based
    /// on the user's current scrolling position.
    final int leadingColumn = math.max((horizontalPixels / 200).floor(), 0);
    final int leadingRow = math.max((verticalPixels / 200).floor(), 0);
    final int trailingColumn = math.min(
      ((horizontalPixels + viewportWidth) / 200).ceil(),
      maxColumnIndex,
    );
    final int trailingRow = math.min(
      ((verticalPixels + viewportHeight) / 200).ceil(),
      maxRowIndex,
    );

    ///TR İki iç içe döngü, görünen sütun ve satırlar arasında dolaşarak her bir çocuk elemanın düzenini hesaplar.
    /// Çocuk elemanların yerleşim ofseti, xLayoutOffset ve yLayoutOffset kullanılarak ayarlanır.

    ///EN Two nested loops calculate the layout of each child element by looping
    /// through the visible columns and rows. The layout offset of child elements
    /// is set using xLayoutOffset and yLayoutOffset.
    double xLayoutOffset = (leadingColumn * 200) - horizontalOffset.pixels;
    for (int column = leadingColumn; column <= trailingColumn; column++) {
      double yLayoutOffset = (leadingRow * 200) - verticalOffset.pixels;
      for (int row = leadingRow; row <= trailingRow; row++) {
        final ChildVicinity vicinity =
            ChildVicinity(xIndex: column, yIndex: row);
        final RenderBox child = buildOrObtainChildFor(vicinity)!;
        child.layout(constraints.loosen());
        // Subclasses only need to set the normalized layout offset. The super
        // class adjusts for reversed axes.

        parentDataOf(child).layoutOffset = Offset(xLayoutOffset, yLayoutOffset);
        yLayoutOffset += 200;
      }
      xLayoutOffset += 200;
    }

    ///TR gridX ve gridY, viewport genişliği ve yüksekliği üzerinden alınan eksen değerlerini temsil eder.

    ///EN gridX and gridY represent axis values ​​taken over the viewport width and height.
    gridX = getCoordinate(viewportWidth);
    gridY = getCoordinate(viewportHeight);
    horizontalGlobalPixels = getCoordinate(horizontalPixels);
    verticalGlobalPixels = getCoordinate(verticalPixels);
    viewportW = getCoordinate(viewportWidth);
    viewportH = getCoordinate(viewportHeight);
    extentV = getCoordinate(extentV);
    extentH = getCoordinate(extentH);
    // Set the min and max scroll extents for each axis.

    ///TR verticalOffset ve horizontalOffset, dikey ve yatay kaydırma sınırlarını belirler.
    /// Bu sınırlar, 200 birimlik ızgaraların toplam uzunluğuna bağlı olarak ayarlanır.

    /// EN verticalOffset and horizontalOffset determine the vertical and horizontal
    /// scrolling limits. These limits are set based on the total length of the 200-unit grids.
    final double verticalExtent = 200 * (maxRowIndex + 1);
    verticalOffset.applyContentDimensions(
      0.0,
      clampDouble(
          verticalExtent - viewportDimension.height, 0.0, double.infinity),
    );
    final double horizontalExtent = 200 * (maxColumnIndex + 1);
    horizontalOffset.applyContentDimensions(
      0.0,
      clampDouble(
          horizontalExtent - viewportDimension.width, 0.0, double.infinity),
    );
  }
}
