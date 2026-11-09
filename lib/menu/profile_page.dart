import 'package:flutter/material.dart';
import 'package:fluttercoba/controller/login_controller.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil username dari LoginController jika ada
    final loginController = Get.isRegistered<LoginController>()
        ? Get.find<LoginController>()
        : null;
    final username = loginController?.txtUsername.text.isNotEmpty == true
        ? loginController!.txtUsername.text
        : 'instagram_user';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 16,
        title: Row(
          children: [
            const Icon(Icons.lock_outline, size: 16, color: Color(0xFF262626)),
            const SizedBox(width: 6),
            Text(
              username,
              style: const TextStyle(
                color: Color(0xFF262626),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xFF262626)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined,
                color: Color(0xFF262626), size: 26),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Color(0xFF262626), size: 26),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // ---- Profile Header ----
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar + Stats Row
                Row(
                  children: [
                    // Avatar dengan Instagram Story Gradient Ring
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2.5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFFBAA47),
                                Color(0xFFD91A46),
                                Color(0xFFA60F93),
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(2.5),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const CircleAvatar(
                              radius: 38,
                              backgroundColor: Color(0xFFEFEFEF),
                              child: Icon(
                                Icons.person,
                                size: 44,
                                color: Color(0xFF9E9E9E),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF0095F6),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 24),

                    // Stats (Posts, Followers, Following)
                    const Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _StatColumn(label: 'Posts', value: '5'),
                          _StatColumn(label: 'Followers', value: '1.2k'),
                          _StatColumn(label: 'Following', value: '348'),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Name & Bio
                Text(
                  username.capitalizeFirst ?? username,
                  style: const TextStyle(
                    color: Color(0xFF262626),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Mobile Developer 🚀\nExploring Flutter & GetX 💻',
                  style: TextStyle(
                    color: Color(0xFF262626),
                    fontSize: 13,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 3),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'mediadwi.com',
                    style: TextStyle(
                      color: Color(0xFF00376B),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Action Buttons (Edit Profile, Share Profile, Add Person)
                Row(
                  children: [
                    Expanded(
                      child: _ProfileButton(
                        label: 'Edit profile',
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: _ProfileButton(
                        label: 'Share profile',
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 6),
                    _ProfileIconButton(
                      icon: Icons.person_add_alt_1_outlined,
                      onTap: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Story Highlights
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _HighlightItem(label: 'New', isAddButton: true),
                      _HighlightItem(label: 'Travel', icon: Icons.flight_takeoff),
                      _HighlightItem(label: 'Food', icon: Icons.restaurant),
                      _HighlightItem(label: 'Coding', icon: Icons.code),
                      _HighlightItem(label: 'Life', icon: Icons.favorite_border),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ---- Grid / Reels / Tagged Tabs ----
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          _GridReelTabBar(),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),

          // ---- Posts Grid ----
          const Expanded(
            child: _PostsGrid(),
          ),
        ],
      ),
    );
  }
}

// ===========================================================
// Sub Widgets
// ===========================================================

class _StatColumn extends StatelessWidget {
  final String label;
  final String value;

  const _StatColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF262626),
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF262626),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class _ProfileButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _ProfileButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFEFEFEF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFF262626),
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

class _ProfileIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ProfileIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 34,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFEFEFEF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 18, color: const Color(0xFF262626)),
      ),
    );
  }
}

class _HighlightItem extends StatelessWidget {
  final String label;
  final bool isAddButton;
  final IconData? icon;

  const _HighlightItem({
    required this.label,
    this.isAddButton = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isAddButton ? const Color(0xFFDBDBDB) : const Color(0xFFC7C7C7),
                width: 1,
              ),
            ),
            child: CircleAvatar(
              backgroundColor: const Color(0xFFFAFAFA),
              child: Icon(
                isAddButton ? Icons.add : (icon ?? Icons.image_outlined),
                size: isAddButton ? 26 : 24,
                color: const Color(0xFF262626),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF262626),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class _GridReelTabBar extends StatefulWidget {
  @override
  State<_GridReelTabBar> createState() => _GridReelTabBarState();
}

class _GridReelTabBarState extends State<_GridReelTabBar> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _tabItem(Icons.grid_on, 0),
        _tabItem(Icons.play_circle_outline, 1),
        _tabItem(Icons.person_pin_outlined, 2),
      ],
    );
  }

  Widget _tabItem(IconData icon, int index) {
    final isSelected = _selected == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selected = index),
        child: Container(
          height: 42,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? const Color(0xFF262626) : Colors.transparent,
                width: 1.5,
              ),
            ),
          ),
          child: Icon(
            icon,
            size: 24,
            color: isSelected ? const Color(0xFF262626) : const Color(0xFF8E8E8E),
          ),
        ),
      ),
    );
  }
}

class _PostsGrid extends StatelessWidget {
  const _PostsGrid();

  final List<String> _images = const [
    'assets/image/nasi padang.jpe',
    'assets/image/nasi uduk.jpe',
    'assets/image/Oseng Ayam.jpe',
    'assets/image/paket.jpe',
    'assets/image/Sate Ayam.jpe',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        if (index < _images.length) {
          return Image.asset(
            _images[index],
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => _placeholder(index),
          );
        }
        return _placeholder(index);
      },
    );
  }

  Widget _placeholder(int index) {
    final colors = [
      const Color(0xFFE1BEE7),
      const Color(0xFFBBDEFB),
      const Color(0xFFC8E6C9),
      const Color(0xFFFFE0B2),
    ];
    return Container(
      color: colors[index % colors.length],
      child: Center(
        child: Icon(
          Icons.image_outlined,
          color: Colors.white.withOpacity(0.7),
          size: 28,
        ),
      ),
    );
  }
}
