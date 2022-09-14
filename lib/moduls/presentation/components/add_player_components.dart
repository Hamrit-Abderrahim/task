import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/bloc.dart';
import '../controller/state.dart';

class AddPlayer extends StatelessWidget {
  const AddPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersBloc, PlayersState>(builder: (context, state) {
      var cubit = PlayersBloc.get(context);
      return ConditionalBuilder(
          condition: state is! GetPlayersLoadingState,
          builder: (context) => SizedBox(
              height: 80.0,
              child: ListView.separated(
                separatorBuilder: ((context, index) => const SizedBox(
                      width: 10.0,
                    )),
                scrollDirection: Axis.horizontal,
                itemCount: PlayersBloc.get(context).users.length,
                itemBuilder: (context, index) =>
                    cubit.users[index].isAdd == false
                        ? Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  cubit.addPlayer(index);
                                },
                                icon: const Icon(Icons.person_add)))
                        : Stack(
                            alignment: Alignment.topRight,
                            children: [
                              CachedNetworkImage(
                                  imageUrl: cubit.users[index].image),
                              Positioned(
                                top: -10,
                                right: -10,
                                child: StatefulBuilder(
                                  builder: (BuildContext context, setState) {
                                    return IconButton(
                                        onPressed: () {
                                          cubit.removePlayer(index);
                                        },
                                        icon: const Icon(
                                          Icons.cancel,
                                          color: Colors.red,
                                          size: 30.0,
                                        ));
                                  },
                                ),
                              ),
                            ],
                          ),
              )),
          fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ));
    });
  }
}
