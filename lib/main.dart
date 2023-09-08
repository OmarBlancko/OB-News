import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

import 'src/config/app_themes.dart';
import 'src/config/router/app_router.dart';
import 'src/domain/repositories/api_repository.dart';
import 'src/domain/repositories/database_repository.dart';
import 'src/locator.dart';
import 'src/presentation/cubits/local_articles/local_articles_cubit.dart';
import 'src/presentation/cubits/remote_articles/remote_articles_cubit.dart';
import 'src/utils/constants/app_strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,

      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => RemoteArticlesCubit(
                locator<ApiRepository>(),
              )..getBreakingNewsArticles(),
            ),
            BlocProvider(
              create: (context) => LocalArticlesCubit(
                  locator<DatabaseRepository>()..getAllSavedArticles()),
            )
          ],
          child: OKToast(
            child: MaterialApp.router(
              routerConfig: AppRouter.router,
              theme: AppTheme.light,
              title: appTitle,
              debugShowCheckedModeBanner: false,

            ),
          ),
        );
      },
    );
  }
}
