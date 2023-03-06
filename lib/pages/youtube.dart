import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
class YoutubePlay extends StatelessWidget {
  const YoutubePlay({super.key});

  @override
 void getVideoUrl() async {
  var playlistUrl = "https://www.youtube.com/playlist?list=PLFyjjoCMAPtzvnHnby5Yu9idvwqXI-ujn";

  // create a YouTubeExplode instance
  var yt = YoutubeExplode();

  // get the playlist metadata
  print("before");
  var playlist = await yt.playlists.get(playlistUrl);
  print("after");

  // get the first video in the playlist
   var videos = yt.playlists.getVideos(playlistUrl);
  var video = (await videos.toList())[0];
  print("after ????????????//");

  // get the video URL
  var videoUrl = "https://www.youtube.com/watch?v=${video.id}";

  // print the video URL
  print(videoUrl);
 }
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
    body: ElevatedButton(onPressed:(){getVideoUrl();},child: Text("call"),),


    );
  }
}