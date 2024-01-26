part of '../new_node_template_screen.dart';

class ItemPalette extends StatelessWidget {
  const ItemPalette({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.pathfinderTheme.colors.backgroundColor,
        border: const Border(
          left: BorderSide(color: Colors.white, width: 1),
        ),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.all(4),
        itemBuilder: (BuildContext context, int index) {
          final item = NodePaletteItem.values[index];
          return Draggable(
            data: item,
            feedback: SvgPicture.asset(
              item.icon,
            ),
            child: InkWell(
              hoverColor: context.pathfinderTheme.colors.textColor,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SvgPicture.asset(
                    item.icon,
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: NodePaletteItem.values.length,
      ),
    );
  }
}
