import 'package:material_portfolio_webapp/src/entity/social.dart' show Social;
import 'package:flutter/material.dart' show Color;
import 'dart:core';

List<Social> socials = <Social>[
  Social(
      asset: "github",
      color: const Color(0xFFFFFFFF),
      link: Uri.parse("https://large-type.com/#vpp%231032")),
  Social(
      asset: "discord",
      color: const Color(0xFF7289DA),
      link: Uri.parse("https://www.github.com/vaibhavppandey")),
  Social(
      asset: "outlook",
      color: const Color(0xFF0072C6),
      link: Uri.parse("https://large-type.com/#vaibhav.ppandey%40outlook.com")),
];

List<String> texts = <String>[
  "Hello I'm Vaibhav",
  "I am into Flutter",
  "I <3 openSource",
];
