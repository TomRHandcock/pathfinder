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
          return const Padding(
            padding: EdgeInsets.all(4),
            child: AspectRatio(
              aspectRatio: 1,
              child: ColoredBox(color: Colors.purple),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
