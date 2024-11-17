import 'package:flutter/material.dart';
import 'package:fudamental_flutter/W6-S1-PRACTICE-List-PassFunction/EXERCISE-2/model/profile_tile_model.dart';

ProfileData ronanProfile = ProfileData(
    name: "Ronan",
    position: "Flutter Developer",
    avatarUrl: 'assets/W6-S1/aang.jpg',
    tiles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(
          icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(icon: Icons.email, title: "Mail", value: "ronan.ogogr@cadt.edu"),
    ]);
ProfileData alexProfile = ProfileData(
  name: "Alex",
  position: "Senior Backend Developer",
  avatarUrl: 'assets/W6-S1/avatar_alex.png',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+987 654 3210"),
    TileData(icon: Icons.location_on, title: "Address", value: "456 Silicon Valley, USA"),
    TileData(icon: Icons.email, title: "Mail", value: "alex.smith@techcorp.com"),
    TileData(icon: Icons.work, title: "Company", value: "TechCorp Inc."),
    TileData(icon: Icons.web, title: "Website", value: "www.alexbackend.com"),
    TileData(icon: Icons.language, title: "Languages", value: "English, Spanish"),
    TileData(icon: Icons.assignment_ind, title: "Role", value: "Lead Backend Developer"),
    TileData(icon: Icons.linked_camera, title: "Portfolio", value: "alexportfolio.com"),
    TileData(icon: Icons.access_alarm, title: "Timezone", value: "PST (GMT-8)"),
    TileData(icon: Icons.notifications, title: "Slack", value: "alex_dev_slack"),
  ],
);
ProfileData johnProfile = ProfileData(
  name: "John",
  position: "Product Manager",
  avatarUrl: 'assets/W6-S1/avatar_john.png',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+321 654 9870"),
    TileData(icon: Icons.location_on, title: "Address", value: "789 New York, USA"),
    TileData(icon: Icons.email, title: "Mail", value: "john.doe@product.com"),
    TileData(icon: Icons.business, title: "Company", value: "Product Co."),
    TileData(icon: Icons.access_time, title: "Work Hours", value: "9 AM - 6 PM"),
    TileData(icon: Icons.date_range, title: "Birthday", value: "January 1, 1990"),
    TileData(icon: Icons.group, title: "Team Size", value: "12"),
    TileData(icon: Icons.comment, title: "Feedback", value: "john@feedback.com"),
  ],
);
ProfileData sophiaProfile = ProfileData(
  name: "Sophia",
  position: "UX/UI Designer",
  avatarUrl: 'assets/W6-S1/avatar_sophia.png',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+432 109 8765"),
    TileData(icon: Icons.location_on, title: "Address", value: "456 Design St, Berlin"),
    TileData(icon: Icons.email, title: "Mail", value: "sophia.design@studio.com"),
    TileData(icon: Icons.design_services, title: "Company", value: "Design Studio"),
    TileData(icon: Icons.palette, title: "Design Tool", value: "Figma, Sketch"),
    TileData(icon: Icons.link, title: "Portfolio", value: "www.sophiadesign.com"),
    TileData(icon: Icons.home, title: "Hobbies", value: "Photography, Painting"),
    TileData(icon: Icons.star, title: "Favorite Quote", value: "Design is intelligence made visible."),
  ],
);
