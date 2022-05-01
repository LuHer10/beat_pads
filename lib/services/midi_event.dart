import 'package:flutter_midi_command/flutter_midi_command_messages.dart';

abstract class Event {
  int channel;
  int? currentNoteOn;
  int releaseTime = 0;

  Event(this.channel, this.currentNoteOn);

  void updateReleaseTime() =>
      releaseTime = DateTime.now().millisecondsSinceEpoch;

  kill();
}

class NoteEvent extends Event {
  NoteEvent(int channel, int note, int velocity) : super(channel, note) {
    NoteOnMessage(channel: channel, note: note, velocity: velocity).send();
  }

  revive(int newChan, int note, int velocity) {
    channel = newChan;
    currentNoteOn = note;
    NoteOnMessage(channel: newChan, note: note, velocity: velocity).send();
  }

  @override
  kill() {
    if (currentNoteOn != null) {
      NoteOffMessage(channel: channel, note: currentNoteOn!).send();
      updateReleaseTime();

      currentNoteOn = null;
    }
  }
}

// class ATEvent extends Event {}

// class SlideEvent extends Event {}

// class PitchBend extends Event {}

// class CCEvent extends Event {}
