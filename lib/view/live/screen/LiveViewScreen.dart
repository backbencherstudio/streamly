import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/themes/color.dart';
import '../../../data/bloc/live_view/live_view_bloc.dart';
import '../../../data/bloc/live_view/live_view_event.dart';
import '../../../data/bloc/live_view/live_view_state.dart';
import '../widgets/live_view_body.dart';

class LiveViewScreen extends StatefulWidget {
  const LiveViewScreen({super.key});

  @override
  State<LiveViewScreen> createState() => _LiveViewScreenState();
}

class _LiveViewScreenState extends State<LiveViewScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LiveViewBloc>().add(LoadLiveView());
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SizedBox.expand(
          child: BlocBuilder<LiveViewBloc, LiveViewState>(
            builder: (context, state) {
              if (state is LiveViewLoaded) {
                return LiveViewBody(liveViewModel: state.liveViewModel);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
