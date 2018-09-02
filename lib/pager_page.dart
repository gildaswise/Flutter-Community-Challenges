import 'package:flutter/material.dart';

/// A interface to semplify the rendering of a page it's other components.
/// Right now it handles only the
abstract class PagerPage extends Widget {
  Widget fabBuilder(BuildContext context);
}
