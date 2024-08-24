import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/base/baseScreen.dart';
import '../view-model/homebottomBarViewModel.dart';

class HomeBottomBarView extends StatelessWidget {
  const HomeBottomBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen<HomeBottomBarViewModel>(
      viewmodel: HomeBottomBarViewModel(),
      onInitViewModel: (viewModel) {
        // Initialization code goes here
      },
      builder: (context, viewModel, child, deviceScreen) {
        return Scaffold(
          body: Center(
            child: Consumer<HomeBottomBarViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.loadingMain) {
                  return const CircularProgressIndicator();
                } else if (viewModel.msgError != null) {
                  return Text('Error: ${viewModel.msgError}');
                } else {
                  return viewModel.getSelectedWidget();
                }
              },
            ),
          ),
          bottomNavigationBar: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/image/Asset 20@4x.png', // Path to your background image
                  fit: BoxFit.fill,
                ),
              ),
              Consumer<HomeBottomBarViewModel>(
                builder: (context, viewModel, child) {
                  List<String> icons = viewModel.getIcons();
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0), // Adjust the top padding as needed
                    child: SizedBox(
                      height: 80, // Adjust the height as needed
                      child: NavigationBar(
                        destinations: <NavigationDestination>[
                          NavigationDestination(
                            icon: Image.asset(
                              icons[0],
                              height: 60,
                              width: 60,
                            ),
                            label: '',
                          ),
                          NavigationDestination(
                            icon: Image.asset(
                              icons[1],
                              height: 60,
                              width: 60,
                            ),
                            label: '',
                          ),
                          NavigationDestination(
                            icon: Image.asset(
                              icons[2],
                              height: 60,
                              width: 60,
                            ),
                            label: '',
                          ),
                          NavigationDestination(
                            icon: Image.asset(
                              icons[3],
                              height: 60,
                              width: 60,
                            ),
                            label: '',
                          ),
                          NavigationDestination(
                            icon: Image.asset(
                              icons[4],
                              height: 60,
                              width: 60,
                            ),
                            label: '',
                          ),
                        ],
                        selectedIndex: viewModel.selectedIndex,
                        onDestinationSelected: viewModel.onItemTapped,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
