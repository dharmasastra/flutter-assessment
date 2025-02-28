import 'package:flutter/material.dart';
import 'package:flutter_app1/home/bloc/bloc_bloc.dart';
import 'package:flutter_app1/home/views/widgets/banner_slider.dart';
import 'package:flutter_app1/home/views/widgets/bottom_navigation.dart';
import 'package:flutter_app1/home/views/widgets/gradient_border_search_bar.dart';
import 'package:flutter_app1/home/views/widgets/product_ranking_list.dart';
import 'package:flutter_app1/home/views/widgets/top_reviewer_section.dart';
import 'package:flutter_app1/profile/bloc/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Logo and Search Bar - Fixed at top
            _buildHeader(),

            // Divider
            Divider(height: 1, thickness: 1, color: Colors.grey.shade300),

            // Main scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Summer fan banner
                    BannerSlider(),

                    // Product Rankings
                    _buildRankingSection(),

                    _buildTopReviewersSection(context),

                    // More content can be added here

                    // Footer Section
                    _buildFooter(),
                  ],
                ),
              ),
            ),

            // Bottom Navigation - Fixed at bottom
            CustomBottomNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        // Logo section
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          alignment: Alignment.centerLeft,
          child: const Text(
            'LOGO',
            style: TextStyle(
              color: Color(0xFF5D5FEF),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const GradientBorderSearchBar(),
      ],
    );
  }

  Widget _buildRankingSection() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '리뷰 랭킹⭐ top 3',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.chevron_right),
              ],
            ),
          ),

          // Product list with BLoC
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductsLoaded) {
                return ProductRankingList(products: state.topProducts);
              } else if (state is ProductsError) {
                return const Center(child: Text('Error loading products'));
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTopReviewersSection(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '골드 게임 사용자들이에요',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 4),
                const Row(
                  children: [
                    Text(
                      '베스트 리뷰어 ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.emoji_events, color: Colors.amber, size: 20),
                    Text(
                      ' Top10',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProfileLoaded) {
                return TopReviewerSection(profile: state.profile);
              } else if (state is ProfileError) {
                return const Center(child: Text('Error loading profile'));
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Company Logo
          Text(
            'LOGO Inc.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 20),

          // Menu Links
          Row(
            children: [
              Text(
                '회사 소개',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(width: 8),
              Text('|', style: TextStyle(color: Colors.grey.shade400)),
              const SizedBox(width: 8),
              Text(
                '인재 채용',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(width: 8),
              Text('|', style: TextStyle(color: Colors.grey.shade400)),
              const SizedBox(width: 8),
              Text(
                '기술 블로그',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(width: 8),
              Text('|', style: TextStyle(color: Colors.grey.shade400)),
              const SizedBox(width: 8),
              Text(
                '리뷰 저작권',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Contact Email
          Row(
            children: [
              Icon(Icons.mail_outline, size: 18, color: Colors.grey.shade500),
              const SizedBox(width: 8),
              Text(
                'review@logo.com',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          Divider(color: Colors.grey.shade300),
          const SizedBox(height: 16),

          // Bottom Row with Copyright and Language Selector
          Row(
            children: [
              Expanded(
                child: Text(
                  '@2022-2022 LOGO Lab, Inc. (주)아무개 서울시 강남구',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'KOR',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
