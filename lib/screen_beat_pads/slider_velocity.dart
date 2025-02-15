import 'package:beat_pads/screen_beat_pads/sliders_theme.dart';
import 'package:beat_pads/services/services.dart';
import 'package:beat_pads/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SliderVelocity extends ConsumerStatefulWidget {
  const SliderVelocity({
    required this.channel,
    required this.randomVelocity,
    super.key,
  });

  final int channel;
  final bool randomVelocity;

  @override
  ConsumerState<SliderVelocity> createState() => _SliderVelocityState();
}

class _SliderVelocityState extends ConsumerState<SliderVelocity> {
  final double fontSizeFactor = 0.3;
  final double paddingFactor = 0.1;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 5,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Vel',
                  style: TextStyle(
                    fontSize: constraints.maxWidth * fontSizeFactor,
                    color: Palette.darker(Palette.cadetBlue, 0.6),
                  ),
                ),
              );
            },
          ),
        ),
        Center(
          child: Divider(
            indent: width * ThemeConst.borderFactor,
            endIndent: width * ThemeConst.borderFactor,
            thickness: width * ThemeConst.borderFactor,
          ),
        ),
        if (!widget.randomVelocity)
          Flexible(
            flex: 30,
            child: ThemedSlider(
              thumbColor: Palette.cadetBlue,
              child: Slider(
                allowedInteraction: SliderInteraction.slideThumb,
                min: 10,
                max: 127,
                value: ref
                    .watch(
                      senderProvider.select(
                        (value) => value
                            .playModeHandler.velocityProvider.velocityFixed,
                      ),
                    )
                    .clamp(10, 127)
                    .toDouble(),
                onChanged: (v) {
                  ref
                      .read(senderProvider.notifier)
                      .playModeHandler
                      .velocityProvider
                      .velocityFixed = v.toInt();
                },
                onChangeEnd: (_) {},
              ),
            ),
          ),
        if (widget.randomVelocity)
          Flexible(
            flex: 30,
            child: ThemedSlider(
              range: ref.watch(
                senderProvider.select(
                  (value) =>
                      value.playModeHandler.velocityProvider.velocityRange,
                ),
              ),
              thumbColor: Palette.cadetBlue,
              child: Slider(
                allowedInteraction: SliderInteraction.slideThumb,
                min: 10,
                max: 127,
                value: ref
                    .watch(
                      senderProvider.select(
                        (value) => value.playModeHandler.velocityProvider
                            .velocityRandomCenter,
                      ),
                    )
                    .clamp(10, 127),
                onChanged: (v) {
                  ref
                      .read(senderProvider.notifier)
                      .playModeHandler
                      .velocityProvider
                      .velocityRandomCenter = v;
                },
              ),
            ),
          ),
        Center(
          child: Divider(
            indent: width * ThemeConst.borderFactor,
            endIndent: width * ThemeConst.borderFactor,
            thickness: width * ThemeConst.borderFactor,
          ),
        ),
        Flexible(
          flex: 5,
          child: FractionallySizedBox(
            widthFactor: 0.95,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final double padSpacing = width * ThemeConst.padSpacingFactor;
                return Container(
                  margin: EdgeInsets.only(bottom: padSpacing),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Text(
                          ref.watch(velocityModeProv) != VelocityMode.fixed
                              ? '${ref.watch(senderProvider.select((value) => value.playModeHandler.velocityProvider.velocityRandomCenter)).round()}'
                              : '${ref.watch(senderProvider.select((value) => value.playModeHandler.velocityProvider.velocityFixed))}',
                          style: DefaultTextStyle.of(context).style.copyWith(
                                fontSize: constraints.maxWidth * fontSizeFactor,
                                color: Palette.darker(Palette.cadetBlue, 0.6),
                              ),
                        ),
                      ),
                      Flexible(
                        child: ref.watch(velocityModeProv) != VelocityMode.fixed
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${String.fromCharCode(177)}${ref.watch(senderProvider.select((value) => value.playModeHandler.velocityProvider.velocityRange)) ~/ 2}',
                                  style: TextStyle(
                                    fontSize: constraints.maxWidth *
                                        fontSizeFactor *
                                        0.6,
                                    fontWeight: FontWeight.w300,
                                    color:
                                        Palette.darker(Palette.cadetBlue, 0.7),
                                  ),
                                ),
                              )
                            : const SizedBox.expand(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
