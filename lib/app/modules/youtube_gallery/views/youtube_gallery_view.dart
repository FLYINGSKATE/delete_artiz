import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/media_model.dart';
import '../../global_widgets/circular_loading_widget.dart';
import '../controllers/youtube_gallery_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeGalleryView extends GetView<YoutubeGalleryController> {

  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;


  List youtubeVideoList = [
    'p6L3_Q2swhM',
    'WKYvD3qoSh4',
    'JtW6GkJJ-A8',
    'p6L3_Q2swhM',
    'WKYvD3qoSh4',
    'JtW6GkJJ-A8',
    'p6L3_Q2swhM',
    'WKYvD3qoSh4',
    'JtW6GkJJ-A8',
  ];

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'DSC2b4BoMJU',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Video Gallery".tr,
          style: context.textTheme.headline6,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.white70),
          onPressed: () => {Get.back()},
        ),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.amber,
              progressColors: ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
              onReady: () {
                _controller.addListener(listener);
              },
            ),
            SizedBox(height: 20,),
            Text("Watch Our Youtube Videos".tr, style: Get.textTheme.headline3),
            SizedBox(height: 20,),
            Flexible(
              flex: 10,
              child: GridView.builder(
                itemCount: youtubeVideoList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.0,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0
                ),
                itemBuilder: (BuildContext context, int index){
                  return Container(

                    child: YoutubePlayer(
                      controller:  YoutubePlayerController(
                        initialVideoId: youtubeVideoList[index],
                        flags: YoutubePlayerFlags(
                          autoPlay: false,
                          mute: false,
                        ),
                      ),
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.amber,
                      progressColors: ProgressBarColors(
                        playedColor: Colors.amber,
                        handleColor: Colors.amberAccent,
                      ),

                    ),
                  );
                },
              ),
            )
          ],
        )
      ),
    );
  }

  void listener() {
    if (_isPlayerReady  && !_controller.value.isFullScreen) {
      _playerState = _controller.value.playerState;
      _videoMetaData = _controller.metadata;
    }
  }

}
