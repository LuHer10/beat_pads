import 'package:beat_pads/screen_pads_menu/drop_down_playmode.dart';
import 'package:beat_pads/screen_pads_menu/slider_int.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:beat_pads/services/_services.dart';

class MenuInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(builder: (context, settings, child) {
      return ListView(
        children: <Widget>[
          ListTile(
            title: Divider(),
            trailing: Text(
              "Input Settings",
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline5!.fontSize),
            ),
          ),
          ListTile(
            title: Text("Input Mode"),
            subtitle: Text("Sliding Behaviour, MPE and Aftertouch"),
            trailing: DropdownPlayMode(),
          ),
          if (settings.playMode == PlayMode.mpe)
            ListTile(
              title: Text("2-D Modulation"),
              subtitle: Text(
                  "Modulate 2 Parameters on the X and Y Axis. Turn off to modulate only one"),
              trailing: Switch(
                  value: settings.modulationXandY,
                  onChanged: (value) => settings.modulationXandY = value),
            ), // TODO MPE options!!!! :
          if (settings.playMode.afterTouch)
            IntSliderTile(
              min: 5,
              max: 25,
              label: "Modulation Size",
              subtitle:
                  "Size of the modulation field relative to the screen width",
              trailing: Text("${settings.modulationRadius}%"),
              readValue: (settings.modulationRadius * 100).toInt(),
              setValue: (v) => settings.modulationRadius = v / 100,
              resetValue: settings.resetVelocity,
            ),
          if (settings.playMode.afterTouch)
            IntSliderTile(
              min: 0,
              max: 30,
              label: "Modulation Deadzone",
              subtitle:
                  "Size of the center of the modulation field, which does not affect modulation",
              trailing: Text("${settings.modulationDeadZone}%"),
              readValue: (settings.modulationDeadZone * 100).toInt(),
              setValue: (v) => settings.modulationDeadZone = v / 100,
              resetValue: settings.resetVelocity,
            ),
        ],
      );
    });
  }
}
