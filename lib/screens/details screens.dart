import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cuibts/details_cuibt/detailscuibt_cubit.dart';
import '../models/user_model.dart';
import 'full_screen.dart';

class DetailsScreen extends StatelessWidget {
  var personId;
  final String personName;
  final String personImage;
  final String personPopularity;

  DetailsScreen({
    required this.personId,
    required this.personName,
    required this.personImage,
    required this.personPopularity,
  });

  @override
  Widget build(BuildContext context) {
    context.read<DetailsCubit>().getUserDetails(personId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.tealAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<DetailsCubit, DetailscuibtState>(
          builder: (context, state) {
            if (state is DetailscuibtLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is DetailscuibtSuccess) {
              final user = state.userDetails;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageFullScreen(
                            imageUrl:   'https://image.tmdb.org/t/p/w500/$personImage' ?? '',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Image.network(
                       'https://image.tmdb.org/t/p/w500/$personImage' ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    user.name ?? 'Unknown Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Popularity: ${user.popularity}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal[700],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'More details about ${user.name} will be shown here.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ],
              );
            } else if (state is DetailscuibtError) {
              return Center(child: Text('Failed to load details.'));
            }
            return Container(); 
          },
        ),
      ),
    );
  }
}