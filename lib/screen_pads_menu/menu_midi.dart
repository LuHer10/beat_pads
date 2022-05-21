import 'package:beat_pads/screen_pads_menu/slider_int.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:beat_pads/services/_services.dart';

import 'package:beat_pads/screen_pads_menu/slider_non_linear.dart';

import 'package:beat_pads/screen_pads_menu/slider_int_range.dart';

class MenuMidi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(builder: (context, settings, child) {
      return ListView(
        children: <Widget>[
          ListTile(
            title: const Divider(),
            trailing: Text(
              "Midi Settings",
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline5!.fontSize),
            ),
          ),
          IntSliderTile(
            resetValue: settings.resetChannel,
            min: 1,
            max: 16,
            label: "Master Channel",
            subtitle:
                "Midi Channel to send and receive on. Only 1 or 16 with MPE.",
            trailing: Text((settings.channel + 1).toString()),
            setValue: (v) => settings.channel = v - 1,
            readValue: settings.channel + 1,
          ),
          IntSliderTile(
            min: 1,
            max: 15,
            label: "MPE Member Channels",
            subtitle: "Number of member channels to allocate in MPE mode",
            trailing: Text(settings.upperZone
                ? "${15 - settings.mpeMemberChannels} to 15"
                : "2 to ${settings.mpeMemberChannels + 1}"),
            setValue: (v) => settings.mpeMemberChannels = v,
            readValue: settings.mpeMemberChannels,
          ),
          const Divider(),
          ListTile(
            title: const Text("Random Velocity"),
            subtitle: const Text("Random Velocity within a given Range"),
            trailing: Switch(
                value: settings.randomVelocity,
                onChanged: (value) => settings.randomizeVelocity = value),
          ),
          if (!settings.randomVelocity)
            IntSliderTile(
              label: "Fixed Velocity",
              subtitle: "Velocity to send when pressing a Pad",
              trailing: Text(settings.velocity.toString()),
              readValue: settings.velocity,
              setValue: (v) => settings.velocity = v,
              resetValue: settings.resetVelocity,
            ),
          if (settings.randomVelocity)
            MidiRangeSelectorTile(
              label: "Random Velocity Range",
              readMin: settings.velocityMin,
              readMax: settings.velocityMax,
              setMin: (v) => settings.velocityMin = v,
              setMax: (v) => settings.velocityMax = v,
              resetFunction: settings.resetVelocity,
            ),
          const Divider(),
          NonLinearSliderTile(
            label: "Auto Sustain",
            subtitle: "Delay in Milliseconds before sending NoteOff Message",
            readValue: settings.sustainTimeStep,
            setValue: (v) => settings.sustainTimeStep = v,
            resetFunction: () => settings.resetSustainTimeStep(),
            actualValue: "${settings.sustainTimeUsable} ms",
            start: 0,
            steps: 25,
          ),
        ],
      );
    });
  }
}
