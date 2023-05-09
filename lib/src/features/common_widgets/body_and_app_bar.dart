import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/theme/theme_provider.dart';
import '../../provider/todos/to_do_controller.dart';

class BodyAndAppBarNestedScrollView extends ConsumerWidget {
  const BodyAndAppBarNestedScrollView({
    Key? key,
    required this.appBarTitle,
    required this.body,
    this.actions,
    this.centerTitle = false,
  }) : super(key: key);

  final String appBarTitle;
  final Widget body;
  final List<Widget>? actions;
  final bool centerTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeStateProvider = ref.watch(themeProvider);

    return NestedScrollView(
      headerSliverBuilder: (ctx, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            title: Text(appBarTitle),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  themeStateProvider.brightness == Brightness.light
                      ? Icons.nightlight_round
                      : Icons.wb_sunny,
                  color: themeStateProvider.brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
                onPressed: () {
                  ref.read(themeProvider.notifier).toggleTheme();
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.person,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ],
            floating: true,
            pinned: true,
            snap: false,
            primary: true,
            expandedHeight: 180.0,
            // backgroundColor: ,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://picsum.photos/id/870/800/600?${themeStateProvider.brightness != Brightness.light ? 'grayscale' : ''}',
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: AppLocalizations.of(context)?.searchTodos ?? '',
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[200]!,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onChanged: (value) {
                      ref.read(searchQueryProvider.notifier).state = (value);
                    },
                  ),
                )),
          ),
        ];
      },
      body: body,
    );
  }
}
