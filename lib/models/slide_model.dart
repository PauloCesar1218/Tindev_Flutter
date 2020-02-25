import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Slide {
  IconData icon;
  String title;
  String text;
  Color color;

  Slide({
    this.icon,
    this.title,
    this.text,
    this.color
  });
}

List<Slide> Slides = [
  Slide(
    icon: FontAwesomeIcons.fire,
    title: "GET TINDER GOLD",
    text: "See who likes you & more!",
    color: Color.fromRGBO(212, 175, 55, 1)
  ),
  Slide(
    icon: FontAwesomeIcons.bolt,
    title: "Get matches faster",
    text: "Boost your profile once a month!",
    color: Color.fromRGBO(75, 30, 255, 0.9)
  ),
  Slide(
    icon: FontAwesomeIcons.solidStar,
    title: "Stand out with Super Likes",
    text: "Your 3 times more likely to get a match!",
    color: Color.fromRGBO(47, 193, 255, 0.9)
  ),
  Slide(
    icon: FontAwesomeIcons.mapMarker,
    title: "Swipe around the world!",
    text: "Passport to anywhere with Tinder Plus!",
    color: Color.fromRGBO(73, 128, 255, 0.9)
  ),
  Slide(
    icon: FontAwesomeIcons.key,
    title: "Control Your Profile",
    text: "Limit what othes see with Tinder Plus.",
    color: Color.fromRGBO(255, 165, 0, 0.9)
  ),
  Slide(
    icon: FontAwesomeIcons.redo,
    title: "I meant to swipe right",
    text: "Get unlimited Rewinds with Tinder plus!",
    color: Color.fromRGBO(255, 215, 0, 0.9)
  ),
  Slide(
    icon: FontAwesomeIcons.solidHeart,
    title: "Increase you chances",
    text: "Get unlimited likes with Tinder plus!",
    color: Color.fromRGBO(50, 205, 50, 0.9)
  ),
];
