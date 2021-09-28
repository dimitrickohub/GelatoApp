import 'package:flutter/material.dart';

const List song_type_1 = [
  "Hip-hop",
  "Rock",
  "Rap",
  "Classic",
  "Pop",
  "R&B",
];
const List song_type_2 = [
  "Podcasts",
  "Made For You",
  "Charts",
  "New Releases",
  "Discover",
  "Concerts",
];
// const List song = [
//   {
//     "img": "assets/album_img/img_1.jpg",
//     "title": "I love You",
//     "description": "The Neighbourhood",
//     "song_count": "19 songs",
//     "date": "about 19 hr",
//     "color": Color(0xFF808080),
//     "song_url":
//         "https://assets.mixkit.co/music/preview/mixkit-hazy-after-hours-132.mp3",
//     "songs": [
//       {"title": ". How", "duration": "5:14"},
//       {"title": ". Afraid", "duration": "4:11"},
//       {"title": ". Everybody's Watching Me", "duration": "3:58"},
//       {"title": ". Sweater Weather", "duration": "4:00"},
//       {"title": ". Let It Go", "duration": "3:17"},
//       {"title": ". Alleyways", "duration": "4:27"},
//       {"title": ". W.D.Y.W.F.M.?", "duration": "4:19"},
//       {"title": ". Flawless", "duration": "4:06"},
//       {"title": ". Female Robery", "duration": "3:29"},
//       {"title": ". Staying Up", "duration": "4:28"},
//       {"title": ". Float", "duration": "4:21"},
//     ]
//   },
//   {
//     "img": "assets/album_img/img_2.jpg",
//     "title": "Wiped Out!",
//     "description": "The Neighbourhood",
//     "song_count": "324 songs",
//     "date": "about 14 hr",
//     "color": Color(0xFF000000),
//     "song_url":
//         "https://assets.mixkit.co/music/preview/mixkit-raising-me-higher-34.mp3",
//     "songs": [
//       {"title": ". Kaleidoscope", "duration": "2:01"},
//       {"title": ". Larks", "duration": "2:54"},
//       {"title": ". Homeland", "duration": "2:22"},
//       {"title": ". Une Danse", "duration": "3:03"},
//       {"title": ". Almonte", "duration": "2:31"},
//       {"title": ". Days Like These", "duration": "4:09"},
//       {"title": ". In questo momento", "duration": "2:40"},
//     ]
//   },
//   {
//     "img": "assets/album_img/img_3.jpg",
//     "title": "BLOND",
//     "description": "Frank Ocean",
//     "song_count": "195 songs",
//     "date": "about 10 hr",
//     "color": Color(0xFF58546c),
//     "song_url":
//         "https://assets.mixkit.co/music/preview/mixkit-life-is-a-dream-837.mp3",
//     "songs": [
//       {"title": ". Escaping Time", "duration": "3:20"},
//       {"title": ". Just Look at You", "duration": "3:07"},
//       {"title": ". Flowing", "duration": "2:11"},
//       {"title": ". With Resolve", "duration": "2:09"},
//       {"title": ". Infinite Sustain", "duration": "2:29"},
//       {"title": ". Ingénue", "duration": "2:38"},
//       {"title": ". Hidden Chambers", "duration": "2:49"},
//     ]
//   },
//   {
//     "img": "assets/album_img/img_4.jpg",
//     "title": "PLAYERS CLUB",
//     "description": "OBLADAET",
//     "song_count": "599 songs",
//     "date": "about 21 hr",
//     "color": Color(0xFFbad6ec),
//     "song_url":
//         "https://assets.mixkit.co/music/preview/mixkit-dance-with-me-3.mp3",
//     "songs": [
//       {"title": ". Imagination", "duration": "1:21"},
//       {"title": ". Home_", "duration": "2:17"},
//       {"title": ". Do I Wanna Know?", "duration": "1:31"},
//       {"title": ". Whiskey Sour", "duration": "1:42"},
//       {"title": ". Decisions", "duration": "1:29"},
//       {"title": ". Trees", "duration": "1:51"},
//       {"title": ". Earth", "duration": "1:39"},
//     ]
//   },
//   {
//     "img": "assets/album_img/img_5.jpg",
//     "title": "GHETTO GARDEN",
//     "description": "MAYOT",
//     "song_count": "317 songs",
//     "date": "about 11 hr",
//     "color": Color(0xFF93689a),
//     "song_url":
//         "https://assets.mixkit.co/music/preview/mixkit-deep-urban-623.mp3",
//     "songs": [
//       {"title": ". Imagination", "duration": "1:21"},
//       {"title": ". Home_", "duration": "2:17"},
//       {"title": ". Do I Wanna Know?", "duration": "1:31"},
//       {"title": ". Whiskey Sour", "duration": "1:42"},
//       {"title": ". Decisions", "duration": "1:29"},
//       {"title": ". Trees", "duration": "1:51"},
//       {"title": ". Earth", "duration": "1:39"},
//     ]
//   },
//   {
//     "img": "assets/album_img/img_6.jpg",
//     "title": "RAPP2",
//     "description": "Boulevard Depo",
//     "song_count": "130 songs",
//     "date": "about 7 hr",
//     "color": Color(0xFFa4c4d3),
//     "song_url":
//         "https://assets.mixkit.co/music/preview/mixkit-dreaming-big-31.mp3",
//     "songs": [
//       {"title": ". Imagination", "duration": "1:21"},
//       {"title": ". Home_", "duration": "2:17"},
//       {"title": ". Do I Wanna Know?", "duration": "1:31"},
//       {"title": ". Whiskey Sour", "duration": "1:42"},
//       {"title": ". Decisions", "duration": "1:29"},
//       {"title": ". Trees", "duration": "1:51"},
//       {"title": ". Earth", "duration": "1:39"},
//     ]
//   },
//   {
//     "img": "assets/album_img/img_7.jpg",
//     "title": "Flower Boy",
//     "description": "Tyler The Creator",
//     "song_count": "50 songs",
//     "date": "about 17 hr",
//     "color": Color(0xFF5e4f78),
//     "song_url": "https://assets.mixkit.co/music/preview/mixkit-cbpd-400.mp3",
//     "songs": [
//       {"title": ". Kaleidoscope", "duration": "2:01"},
//       {"title": ". Larks", "duration": "2:54"},
//       {"title": ". Homeland", "duration": "2:22"},
//       {"title": ". Une Danse", "duration": "3:03"},
//       {"title": ". Almonte", "duration": "2:31"},
//       {"title": ". Days Like These", "duration": "4:09"},
//       {"title": ". In questo momento", "duration": "2:40"},
//     ]
//   },
//   {
//     "img": "assets/album_img/img_8.jpg",
//     "title": "Chill",
//     "description": "Kick back to the best new and recent chill tunes.",
//     "song_count": "69 songs",
//     "date": "2 hr 14 min",
//     "color": Color(0xFFa4c1ad),
//     "song_url":
//         "https://assets.mixkit.co/music/preview/mixkit-tech-house-vibes-130.mp3",
//     "songs": [
//       {"title": ". Escaping Time", "duration": "3:20"},
//       {"title": ". Just Look at You", "duration": "3:07"},
//       {"title": ". Flowing", "duration": "2:11"},
//       {"title": ". With Resolve", "duration": "2:09"},
//       {"title": ". Infinite Sustain", "duration": "2:29"},
//       {"title": ". Ingénue", "duration": "2:38"},
//       {"title": ". Hidden Chambers", "duration": "2:49"},
//     ]
//   },
//   {
//     "img": "assets/album_img/img_9.jpg",
//     "title": "Sad Songs",
//     "description": "Beautiful songs to break your heart...",
//     "song_count": "60 songs",
//     "date": "3 hr 25 min",
//     "color": Color(0xFFd9e3ec),
//     "song_url":
//         "https://assets.mixkit.co/music/preview/mixkit-piano-reflections-22.mp3",
//     "songs": [
//       {"title": ". Imagination", "duration": "1:21"},
//       {"title": ". Home_", "duration": "2:17"},
//       {"title": ". Do I Wanna Know?", "duration": "1:31"},
//       {"title": ". Whiskey Sour", "duration": "1:42"},
//       {"title": ". Decisions", "duration": "1:29"},
//       {"title": ". Trees", "duration": "1:51"},
//       {"title": ". Earth", "duration": "1:39"},
//     ]
//   },
//   {
//     "img": "assets/album_img/img_10.jpg",
//     "title": "Lo-Fi Beats",
//     "description": "Beats to relax, study and focus.",
//     "song_count": "75 songs",
//     "date": "3 hr 56 min",
//     "color": Color(0xFF4e6171),
//     "song_url":
//         "https://assets.mixkit.co/music/preview/mixkit-sleepy-cat-135.mp3",
//     "songs": [
//       {"title": ". Imagination", "duration": "1:21"},
//       {"title": ". Home_", "duration": "2:17"},
//       {"title": ". Do I Wanna Know?", "duration": "1:31"},
//       {"title": ". Whiskey Sour", "duration": "1:42"},
//       {"title": ". Decisions", "duration": "1:29"},
//       {"title": ". Trees", "duration": "1:51"},
//       {"title": ". Earth", "duration": "1:39"},
//     ]
//   }
// ];
