import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_wallet/features/see_more/data/repos/see_more_repo/see_more_repo_impl.dart';
import 'package:movies_wallet/manager.dart';

import '../../../../core/functions/see_more_get_app_bar_title.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../widgets/see_more_App_bar_with_chip.dart';
import '../../../widgets/see_more_body.dart';
import '../manager/see_more_cubit_cubit.dart';

class SeeMoreView extends StatelessWidget {
  const SeeMoreView(this.mode, {Key? key}) : super(key: key);

  final SeeMoreModes mode;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SeeMoreCubit>(
      create: (context) =>
          SeeMoreCubit(getIt.get<SeeMoreRepoImpl>(), mode)..getSeeMoreMovies(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(getSeeMoreTitle(mode)),
          centerTitle: true,
          actions: [
            SeeMoreAppBarActionChip(mode: mode),
          ],
        ),
        body: const SeeMoreBody(),
      ),
    );
  }
}

