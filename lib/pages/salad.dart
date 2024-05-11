class Saladpage extends StatefulWidget {
  const Saladpage({super.key});

  @override
  State<Saladpage> createState() => _SaladpageState();
}

class _SaladpageState extends State<Saladpage> {
  @override
  Widget build(BuildContext context) {
    return const Container(
      appbar:AppBar(
        Text('Salad')
      )
    );
  }
}
