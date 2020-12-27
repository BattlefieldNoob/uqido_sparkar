import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationRailHeader extends StatelessWidget {
  const NavigationRailHeader({
    @required this.extended,
  }) : assert(extended != null);

  final ValueNotifier<bool> extended;

  @override
  Widget build(BuildContext context) {
    final animation = NavigationRail.extendedAnimation(context);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Align(
          alignment: AlignmentDirectional.centerStart,
          widthFactor: animation.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 56,
                child: Row(
                  children: [
                    const SizedBox(width: 6),
                    InkWell(
                      key: const ValueKey('ReplyLogo'),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: Row(
                        children: [
                          Transform.rotate(
                            angle: animation.value,
                            child: const Icon(
                              Icons.arrow_left,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                          const Text("open"),
                          const SizedBox(width: 10),
                          SizedBox(width: 18 * animation.value),
                        ],
                      ),
                      onTap: () {
                        extended.value = !extended.value;
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}
