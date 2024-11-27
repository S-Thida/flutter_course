import 'package:flutter/material.dart';

import '../model/profile_tile_model.dart';


ProfileData thidaProfile = ProfileData(
    name: "Saphorn Thida",
    position: "Software Developer",
    avatarUrl: 'lib/assets/W6-S2/cutesamoyed.jpg',
    tiles: [
      TileData(icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(icon: Icons.email, title: "Mail", value: "thida.saphorn@student.cadt.edu.kh"),
    ]);
