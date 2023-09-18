//fluttter pub add google_fonts
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
    void dispose() {
    _pageController.dispose();
    super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 20),
          child: Column(
            children: [
              Expanded(
              child: PageView.builder(
                itemCount: demo_data.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnBoardingWidget(
                  image: demo_data[index].image,
                  title: demo_data[index].title,
                  description: demo_data[index].description,
                 ),
               ),
             ),
              Row(
                children: [
                  ...List.generate(
                    demo_data.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    )),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.black),
                        onPressed: (){
                          _pageController.nextPage(
                            duration: const Duration(
                              microseconds: 300,
                              ),
                            curve: Curves.ease,
                          );
                        },
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
               ),
             ], 
           ),
         ),
       ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.isActive
  });

  final bool isActive;

  @override
  Widget build(BuildContext context){
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 16 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? Colors.red : Colors.grey.withOpacity(0.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}

class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnBoard> demo_data = [
  OnBoard(
    image: "assets/images/42146.png",
    title: "42146 :",
    description: "Liebherr Crawler Crane LR 13000",),
  OnBoard(
    image: "assets/images/42157.png",
    title: "42157 :",
    description: "John Deere 948L-II Skidder",),
  OnBoard(
    image: "assets/images/42159.png",
    title: "42159 :",
    description: "Yamaha MT-10 SP",),
  OnBoard(
    image: "assets/images/42060.png",
    title: "42160 :",
    description: "Audi RS Q e-tron",),
  OnBoard(
    image: "assets/images/42061.png",
    title: "42161 :",
    description: "Lamborghini Huracán Tecnica",),

];

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
        image,
        height: 280,
        ),
        const Spacer(),
        Text(
          title,
          textAlign:  TextAlign.center,
           style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 30,),
        Text(
          description,
          textAlign:  TextAlign.center,
           style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}