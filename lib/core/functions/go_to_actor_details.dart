import 'package:flutter/material.dart';
import 'package:movies_wallet/features/actor_details/data/models/actor_model.dart';
import 'package:movies_wallet/features/actor_details/presentation/view/actor_details.dart';

Future<void> goToActorDetails(BuildContext context, Actor actor) async {
  await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ActorDetails(actor)));
}
