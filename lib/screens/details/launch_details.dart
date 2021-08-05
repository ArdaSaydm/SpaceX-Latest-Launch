import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:spacex/cubit/launch_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:spacex/widgets/centered_error_text.dart';
import 'package:spacex/widgets/custom_loading_indicator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LaunchDetails extends StatefulWidget {
  @override
  _LaunchDetailsState createState() => _LaunchDetailsState();
}

class _LaunchDetailsState extends State<LaunchDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('SpaceX Latest Launch'),
        textTheme: Theme.of(context).appBarTheme.textTheme,
      ),
      body: BlocBuilder<LaunchCubit, LaunchState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return CustomLoadingIndicator();
          } else if (state is ErrorState) {
            return CenteredErrorText(
              text: state.message.contains("SocketException")
                  ? "Please, check your internet connection."
                  : state.message,
            );
          } else if (state is LoadedState) {
            final latestLaunchData = state.latestLaunch;
            YoutubePlayerController _controller = YoutubePlayerController(
              initialVideoId: latestLaunchData.links!.youtubeId.toString(),
              flags: YoutubePlayerFlags(
                autoPlay: false,
                mute: false,
              ),
            );

            final df = new DateFormat('dd-MM-yyyy hh:mm a');
            final formattedDate = df.format(
              new DateTime.fromMillisecondsSinceEpoch(
                latestLaunchData.dateUnix! * 1000,
              ),
            );

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: latestLaunchData.links!.patch!.small!,
                      placeholder: (context, url) => CustomLoadingIndicator(),
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          latestLaunchData.name!.length > 13
                              ? latestLaunchData.name!.substring(0, 13)
                              : latestLaunchData.name!,
                          style: Theme.of(context).textTheme.headline1,
                          overflow: TextOverflow.fade,
                        ),
                        Text(
                          formattedDate,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(latestLaunchData.details!,
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.center),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: YoutubePlayer(
                        controller: _controller,
                        liveUIColor: Colors.amber,
                        showVideoProgressIndicator: true,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return CenteredErrorText(
              text: "There are some issues",
            );
          }
        },
      ),
    );
  }
}
