import 'package:material_portfolio_webapp/src/entity/social.dart' show Social;
import 'package:flutter/material.dart' show Color;
import 'dart:core';

List<Social> socials = const <Social>[
  Social(
      asset: "github",
      color: Color(0xFFFFFFFF),
      payload: "https://www.github.com/vaibhavppandey",
      type: "link"),
  Social(
      asset: "discord",
      color: Color(0xFF7289DA),
      payload: "vpp#1032",
      type: "text"),
  Social(
      asset: "outlook",
      color: Color(0xFF0072C6),
      payload: "vaibhav.ppandey@outlook.com",
      type: "mail"),
];

List<String> texts = <String>[
  "Hello I'm Vaibhav",
  "I am into Flutter",
  "I <3 openSource",
];
