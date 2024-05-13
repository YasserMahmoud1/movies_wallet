import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_wallet/features/home/data/repos/saved_repo/saved_repo_impl.dart';
import 'package:movies_wallet/features/home/presentation/manager/movies_manager/movie_cubit/cubit/movie_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'core/utils/service_locator.dart';
import 'features/home/presentation/manager/home_manager/home_bloc.dart';
import 'features/home/presentation/manager/saved_manager/cubit/saved_cubit.dart';
import 'features/home/presentation/views/home/home_view.dart';
import 'manager.dart';

void main() async {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool onboarding = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SharedPreferences.getInstance().then((value) => setState(() {
      onboarding =  value.getBool("on_boarding")?? false;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(create: (context) => MovieCubit()..getMoviesData()),
        BlocProvider(
            create: (context) =>
                SavedCubit(getIt.get<SavedRepoImpl>())..getData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: ColorManager.blues,
          ),
          scaffoldBackgroundColor: ColorManager.blacks,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: ColorManager.lightBlacks,
            selectedItemColor: ColorManager.blues,
            unselectedItemColor: ColorManager.whites,
            type: BottomNavigationBarType.fixed,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: ColorManager.lightBlacks,
          ),
          tabBarTheme: const TabBarTheme(
            indicatorColor: ColorManager.blues,
            labelColor: ColorManager.blues,
          ),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  const BorderSide(color: ColorManager.lightBlacks, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: ColorManager.blues, width: 2),
            ),
          ),
          textTheme: TextTheme(
            headlineMedium: const TextStyle(
              color: ColorManager.whites,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            headlineLarge: const TextStyle(
              color: ColorManager.whites,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: const TextStyle(
              color: ColorManager.whites,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: const TextStyle(
              color: ColorManager.whites,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            bodyMedium: TextStyle(
              color: ColorManager.whites.withOpacity(.75),
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),

        ),
        home: onboarding ? MoviesWallet(): const OnBoarding(),
      ),
    );
  }
}

class MoviesWallet extends StatelessWidget {
  const MoviesWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return const HomeView();
  }
}

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  final cont = PageController();
  bool isLast = false;
  bool isFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          if(!isLast)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:16),
            child: TextButton(onPressed: (){
              cont.jumpToPage(3);
            }, child: Text("Skip", style: TextStyle(color: ColorManager.blues,fontSize: 18),)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          onPageChanged: (index){
            setState(() {
              isLast = index == 2 ;isFirst= index==0;});

          },
          controller: cont,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage("assets/images/icon.png"),width: 200,),
                  SizedBox(height: 16),
                  Text("Welcome To Movies Wallet",style:TextStyle(fontSize: 24,color: ColorManager.whites)),
                ],
              ),
            ),            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/animation/start.json"),
                  SizedBox(height: 16),
                  Text("Search on any movie or actor",style:TextStyle(fontSize: 24,color: ColorManager.whites)),
                ],
              ),
            ),            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/animation/end.json"),
                  SizedBox(height: 16),
                  Text("Find you favourite movies and remember your watch list",style:TextStyle(fontSize: 24,color: ColorManager.whites),textAlign: TextAlign.center,),
                ],
              ),
            ),

          ],
        ),
      ),
      bottomSheet: isLast?TextButton(onPressed: () async{
        final sh = await SharedPreferences.getInstance();
        await sh.setBool("on_boarding", true);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return MoviesWallet();
        },));
      }, child: Text("Get Started"),style: TextButton.styleFrom(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),foregroundColor: ColorManager.whites,backgroundColor: ColorManager.blues,textStyle: TextStyle(fontSize: 20), minimumSize: Size.fromHeight(80),),):Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 16),
        color: ColorManager.lightBlacks,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton.small(onPressed:(){
              cont.previousPage(duration: Duration(microseconds: 500), curve:Curves.easeInOut);
            },backgroundColor: isFirst?ColorManager.blacks:ColorManager.blues, child: Icon(Icons.arrow_back,),),
            SmoothPageIndicator(controller: cont, count: 3,effect: WormEffect(spacing: 16, dotColor: ColorManager.whites,activeDotColor: ColorManager.blues )
              ,onDotClicked: (index)=>  cont.animateToPage(index,duration: Duration(microseconds: 500), curve:Curves.easeInOut)
              ,),
            FloatingActionButton.small(onPressed:(){
              cont.nextPage(duration: Duration(microseconds: 500), curve:Curves.easeInOut);

            },backgroundColor: ColorManager.blues, child: Icon(Icons.arrow_forward),),
          ],
        ),
      ),
    );
  }
}
