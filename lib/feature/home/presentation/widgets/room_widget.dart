import 'dart:ui';

import 'package:abdelmoneam_create_an_animation_scroll/core/utiles/colors.dart';
import 'package:abdelmoneam_create_an_animation_scroll/core/utiles/text.dart';
import 'package:abdelmoneam_create_an_animation_scroll/feature/home/presentation/widgets/shader_effect.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoomItem extends StatelessWidget {
  const RoomItem({
    super.key,
    required this.image,
    required this.title,
    required this.persentage,
    required this.index,
    required this.showInformation,
    required this.selectedIndex,
    this.onSwipeUp,
    this.onSwipeDown,
  });
  final String image, title;
  final void Function()? onSwipeUp, onSwipeDown;
  final double persentage;
  final int index, selectedIndex;
  final bool showInformation;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 200),
        tween: Tween(begin: 0, end: index == selectedIndex ? 1 : 0),
        curve: Curves.fastOutSlowIn,
        builder: (context, value, child) {
          return Stack(
            children: [
              Transform.scale(
                scale: index == selectedIndex ? lerpDouble(.85, 1, value) : 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 70, top: 20),
                  child: InformationCard(
                    isExpanded: showInformation,
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.translationValues(0, -60 * value, 0),
                child: GestureDetector(
                  // onTap: onTap,
                  onVerticalDragEnd: (details) {
                    if (details.velocity.pixelsPerSecond.dy > 0) {
                      print("swipe down");
                      onSwipeDown?.call();
                    } else {
                      print("swipe down");
                      onSwipeUp?.call();
                    }
                  },
                  child: CardImage(
                    image: image,
                    persentage: persentage,
                    title: title,
                  ),
                ),
              ),
            ],
          );
        });
  }
}

class CardImage extends StatelessWidget {
  const CardImage({
    super.key,
    required this.image,
    required this.persentage,
    required this.title,
  });

  final String image;
  final double persentage;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .5,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 12,
            offset: Offset(-7, 7),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
            colorFilter:
                const ColorFilter.mode(Colors.black26, BlendMode.colorBurn),
            alignment: Alignment(lerpDouble(.4, -.4, persentage)!, 0)),
      ),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20),
          //     color: Colors.black54,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            child: FittedBox(
              fit: BoxFit.fitHeight,
              alignment: Alignment.bottomLeft,
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  title,
                  style: AppTextStyle.regularOxTitle.copyWith(
                    color: AppColors.whiteColor,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 10,
            right: 0,
            left: 0,
            child: ShaderEffect(),
          )
        ],
      ),
    );
  }
}

class InformationCard extends StatelessWidget {
  const InformationCard({
    super.key,
    required this.isExpanded,
  });
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: isExpanded ? 1.2 : 0,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 14,
              offset: Offset(-7, 7),
            )
          ],
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .40,
                width: double.infinity,
              ),
              const InfoParameters(
                title: "Temperature",
                icon: FontAwesomeIcons.temperatureQuarter,
                value: "12°",
              ),
              const InfoParameters(
                title: "AirCondition",
                icon: FontAwesomeIcons.droplet,
                value: "23.0%",
              ),
              const InfoParameters(
                title: "Timer",
                icon: FontAwesomeIcons.stopwatch,
                value: "OFF",
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InfoParameters extends StatelessWidget {
  const InfoParameters({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });
  final String title, value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      dense: true,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      leading: FaIcon(
        icon,
        color: AppColors.normalTextColor,
        size: 15,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: Text(
        value,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
