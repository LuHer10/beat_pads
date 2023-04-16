# Beat Pads

## Installation

### Get it from the App Store and support this project...

- [Apple Store](https://apps.apple.com/us/app/beat-pads/id1633882803)
- [Google Play](https://play.google.com/store/apps/details?id=io.anzio.beat_pads&hl=en_AU&gl=US&pli=1)

### ...or compile it yourself

- Install the [Flutter](https://flutter.dev/) toolchain as per [these instructions](https://docs.flutter.dev/get-started/install)
- Clone or download this repository
- Edit and debug with with [VScode](https://code.visualstudio.com/)
- Compile for Android with ```flutter build apk``` or for iOS with ```flutter build ios```
- Install to your device via USB with ```flutter install```

## Information

Beat Pads is a lightweight Midi Controller app for mobile phones and tablets for melodies and finger drumming at home and on the go. Connections can be made virtually to other apps via platform midi channels or via USB to other devices.

This app aims to be an easy-to-use pad input device featuring a variety of layouts, intuitive playability and modern modulation options, such as MPE and Polyphonic Aftertouch. It was designed for people that prefer pads to pianos! The focus of this app is not to be a jack-of-all-trades Midi swiss army knife, but instead to be a great at one thing: Intuitive and versatile pad controls.

This App is **ONLY** usable as a Midi Controller. It does **NOT** produce any sound on its own and requires a host application or a second device with a DAW or other sound production app.

AUv3 is unfortunately not supported at this time, as it is [currently impossible with Flutter](https://github.com/flutter/flutter/issues/16092).

Wifi works on iOS, but Wifi and Bluetooth support is otherwise limited due to platform restrictions.

## Feature Bullet Points

- A size-adjustable grid of pads for finger drumming and melody input
- Various layouts and colors, inspired by the Ableton Push
- Presets can be saved with different pad setups
- Innovative MPE and polyphonic Aftertouch modulation with graphical feedback
- Send Velocity by Y-Axis, randomly or with a fixed value
- Usable as a standard MIDI device with any PC, Mac or other USB host
- Optional controls, such as Pitch Bend, Mod Wheel and Sustain
- Highligh a large number of musical scales
- Receives Midi Notes, making the pads usable like a Launchpad
- Supports virtual Midi connection to other apps on your device
- Built-In support for the popular finger drumming courses from XpressPads.com
- And more...

## Feedback and Contributions

Anyone is most welcome to contribute, report an issue or start a discussion in this repository. Thanks!

## Known issues

- Project still using outdated ChangeNotifier in Riverpod state management -> Refactor

## Licence

Licenced under GPL3. The code in this project is freely usable in any other open source project. Enjoy 👍
