import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbar_app/data/database/tables.dart';
import 'package:qbar_app/domain/blocs/blocs.dart';
import 'package:qbar_app/domain/blocs/history/history_bloc.dart';
import 'package:qbar_app/ui/pages/favorites/widgets/button_browserfavorite.dart';
import 'package:qbar_app/ui/pages/favorites/widgets/button_sharefavorite.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';
import 'package:shimmer/shimmer.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final isarBloc = BlocProvider.of<IsarBloc>(context);
    final historyBloc = BlocProvider.of<HistoryBloc>(context);

    isarBloc.getAllHistories();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            final historyBloc = BlocProvider.of<HistoryBloc>(context);
            Navigator.pop(context);
            await Future.delayed(const Duration(milliseconds: 500));
            historyBloc.add(OnHistoryIsNotLoadedEvent());
          }, 
          icon: const Icon(Icons.arrow_back,
              color: CustomTheme.whiteColor, size: 26.0),
        ),
        backgroundColor: CustomTheme.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Historial',
          style: TextStyle(color: CustomTheme.whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30.0),
          const Center(
            child: Text(
              'Historial de Códigos QR',
              style: TextStyle(
                  color: CustomTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 5.0),
          Expanded(
            child: BlocBuilder<HistoryBloc, HistoryState>(
              builder: (context, stateHistory) {
                return BlocBuilder<IsarBloc, IsarState>(
                  builder: (context, state) {
                    historyBloc.loadHistory();
                    final histories = state.histories;
                    return stateHistory.isLoadedHistory
                        ? HistoryList(histories: histories, historyBloc: historyBloc)
                        : const ShrimmerEffectHistory();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//TODO: REFACTORIZAR ESTE CODIGO
class ShrimmerEffectHistory extends StatelessWidget {
  const ShrimmerEffectHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: CustomTheme.shimmerBaseColor,
        highlightColor: CustomTheme.shimmerHighLightColor,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                  top: 6.0, left: 12.0, right: 12.0, bottom: 6.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: CustomTheme.secondaryColor),
                ),
              ),
            );
          },
        ));
  }
}

class HistoryList extends StatelessWidget {
  const HistoryList({
    Key? key,
    required this.histories,
    required this.historyBloc,
  }) : super(key: key);

  final List<Histories> histories;
  final HistoryBloc historyBloc;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: histories.length,
      itemBuilder: (context, index) {
        final history = histories[index];
        final parseUrl = Uri.parse(history.qrscan);
        return Padding(
          padding: const EdgeInsets.only(top: 6.0, left: 12.0, right: 12.0, bottom: 6.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: CustomTheme.secondaryColor),
              child: Row(
                children: [
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 10.0, bottom: 10.0),
                        child: historyBloc.getDataCodeHistory(history.qrscan)),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: ListTile(
                            title: const Text(
                              'QR',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: CustomTheme.whiteColor),
                            ),
                            subtitle: Text(
                              history.qrscan,
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  color: CustomTheme.whiteColor), 
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonBrowserFavorite(url: parseUrl),
                            const SizedBox(
                              width: 5.0,
                            ),
                            const ButtonShareFavorite(),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}