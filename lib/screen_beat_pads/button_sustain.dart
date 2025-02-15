import 'package:beat_pads/services/services.dart';
import 'package:beat_pads/theme.dart';
import 'package:flutter/material.dart';

class SustainButtonDoubleTap extends StatefulWidget {
  const SustainButtonDoubleTap({required this.channel, super.key});

  final int channel;

  @override
  State<SustainButtonDoubleTap> createState() => _SustainButtonDoubleTapState();
}

class _SustainButtonDoubleTapState extends State<SustainButtonDoubleTap> {
  bool sustainState = true;

  @override
  void dispose() {
    if (sustainState == false) {
      MidiUtils.sendSustainMessage(widget.channel, state: true);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double padRadius = width * ThemeConst.padRadiusFactor;
    final double padSpacing = width * ThemeConst.padSpacingFactor;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, padSpacing, padSpacing, padSpacing),
      child: GestureDetector(
        onDoubleTap: () => setState(() {
          sustainState = false;
          MidiUtils.sendSustainMessage(widget.channel, state: sustainState);
        }),
        onTapDown: (_) {
          if (sustainState) {
            setState(() {
              sustainState = false;
              MidiUtils.sendSustainMessage(widget.channel, state: sustainState);
            });
          }
        },
        onTapUp: (_) {
          if (!sustainState) {
            setState(() {
              sustainState = true;
              MidiUtils.sendSustainMessage(widget.channel, state: sustainState);
            });
          }
        },
        onPanEnd: (_) {
          if (!sustainState) {
            setState(() {
              sustainState = true;
              MidiUtils.sendSustainMessage(widget.channel, state: sustainState);
            });
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(padRadius * 1)),
            color: sustainState ? Palette.lightPink : Palette.darkPink,
            boxShadow: kElevationToShadow[6],
          ),
          child: RotatedBox(
            quarterTurns: 1,
            child: FittedBox(
              child: Text(
                'Sustain',
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.w500,
                  color: Palette.darkGrey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
