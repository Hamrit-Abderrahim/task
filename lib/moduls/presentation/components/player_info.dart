import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/bloc.dart';
import '../controller/state.dart';

class PalyerInfo extends StatelessWidget {
  PalyerInfo({Key? key}) : super(key: key);

  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersBloc, PlayersState>(
        // buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
      var cubit = PlayersBloc.get(context);
      PlayersBloc.get(context).controller(controller);
      var list = cubit.isSearching == false ? cubit.users : cubit.searchList;

      return ConditionalBuilder(
        condition: state is! GetPlayersLoadingState,
        builder: (context) => ListView.builder(
            controller: controller,
            physics: const BouncingScrollPhysics(),
            itemCount: cubit.isLoadingMore ? list.length + 1 : list.length,
            itemBuilder: (context, index) {
              if (index < cubit.users.length) {
                return Row(
                  children: [
                    Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child: CachedNetworkImage(imageUrl: list[index].image)),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      list[index].firstName + list[index].lastName,
                      style: const TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF141c22),
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        list[index].isAdd == false
                            ? cubit.addPlayer(index)
                            : cubit.removePlayer(index);
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.white)),
                          primary: Colors.white,
                          backgroundColor: list[index].isAdd == false
                              ? Colors.blue
                              : Colors.red,
                          textStyle: const TextStyle(
                              fontSize: 14, fontStyle: FontStyle.italic)),
                      child: list[index].isAdd == false
                          ? const Text("add")
                          : const Text("remove"),
                    )
                  ],
                );
              } else {
                return cubit.noMoreData == false
                    ? const Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : const Center(
                        child: Text("No More Data Loded",
                            style: TextStyle(fontSize: 20.0)));
              }
            }),
        fallback: ((context) => const Center(
              child: CircularProgressIndicator(),
            )),
      );
    });
  }
}
