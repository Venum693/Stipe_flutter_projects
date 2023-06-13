import 'dart:io';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';

class AudioRecorderPlayer extends StatefulWidget {
  @override
  _AudioRecorderPlayerState createState() => _AudioRecorderPlayerState();
}

class _AudioRecorderPlayerState extends State<AudioRecorderPlayer> {
  bool _isRecording = false;
  bool _isPlaying = false;
  late AudioPlayer _audioPlayer;
  late String _filePath;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<void> _startRecording() async {
    final path = await _localPath;
    final filePath = '$path/recording.aac';
    await _audioPlayer.stop();
    await _audioPlayer.release();

    setState(() {
      _isRecording = true;
      _isPlaying = false;
      _filePath = filePath;
    });

    await _audioPlayer.startRecorder(
      toFile: _filePath,
      audioOutputFormat: AudioOutputFormat.AAC,
    );
  }

  Future<void> _stopRecording() async {
    await _audioPlayer.stopRecorder();
    setState(() {
      _isRecording = false;
    });
  }

  Future<void> _playRecording() async {
    await _audioPlayer.stop();
    await _audioPlayer.play(_filePath, isLocal: true);
    setState(() {
      _isPlaying = true;
    });

    _audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _isPlaying = false;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Recorder & Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _isRecording ? _stopRecording : _startRecording,
              child: Text(_isRecording ? 'Stop Recording' : 'Start Recording'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isPlaying ? null : _playRecording,
              child: Text('Play Recording'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: AudioRecorderPlayer()));
}
