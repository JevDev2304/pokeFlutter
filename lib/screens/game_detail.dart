import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poke_flutter/models/games_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class GameDetail extends StatefulWidget {
  final PokemonGame game;

  const GameDetail({super.key, required this.game});

  @override
  _GameDetailState createState() => _GameDetailState();
}

class _GameDetailState extends State<GameDetail> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    String videoId = YoutubePlayer.convertUrlToId(widget.game.trailerUrl) ?? '';

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        controlsVisibleAtStart: true,
        hideControls: false,
        loop: false,
        enableCaption: true,
        disableDragSeek: false,
      ),
    );
  }

  void _stopVideoAndExit() {
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
      DeviceOrientation.values,
    ); // Restablecer las orientaciones
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Pokemon ${widget.game.name}',
          style: const TextStyle(fontFamily: 'Montserrat'),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: _stopVideoAndExit,
          icon: const Icon(Icons.arrow_back, color: Colors.redAccent),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        widget.game.image,
                        height: 350,
                        width: double.infinity,
                        fit: BoxFit.contain,
                        errorBuilder:
                            (_, __, ___) =>
                                const Icon(Icons.broken_image, size: 100),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.game.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.game.releaseDate,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.redAccent,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Intro Video',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (_controller != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          color: Colors.white,
                          child: YoutubePlayer(
                            controller: _controller!,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.red,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
