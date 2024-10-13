import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_three/cuibts/home_cuibt/homecuibt_cubit.dart';
import 'details screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {

    context.read<HomecuibtCubit>().getHomeData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Famous People',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.tealAccent,
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<HomecuibtCubit, HomecuibtState>(
              builder: (context, state) {
                if (state is HomecuibtLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is HomecuibtError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else if (state is HomecuibtSuccess) {
                  final people = state.homemodel.results;

                  return ListView.builder(
                    itemCount: people?.length,
                    itemBuilder: (context, index) {
                      final person = people?[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                personId: person?.id ?? 0,
                                personName: person?.name ?? '',
                                personImage: person?.profilePath ?? '',
                                personPopularity: person?.popularity.toString() ?? '',
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(person?.profilePath != null
                                    ? 'https://image.tmdb.org/t/p/w500${person!.profilePath}'
                                    : ''),
                              ),
                              SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Person Name: ${person?.name ?? ''}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Popularity: ${person?.popularity}',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: Text('Unknown state'));
                }
              },

            ),
            ),
        );
  }
}