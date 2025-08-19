
import '../../data/model/comment/comment.dart';
import '../../data/model/content_details/episode.dart';
import '../../data/model/content_details/person.dart';
import '../../data/model/content_details/trailer.dart';
import '../../data/model/live_view/live_view_model.dart';
import '../../data/model/search_result/media_item.dart';

const dummyJson = {
  "categories": [
    {
      "title": "Popular Categories",
      "movies": [
        {
          "id": 1,
          "title": "Music Videos",
          "posterUrl": "https://img.freepik.com/premium-psd/neon-poster-template-electronic-music-with-female-dj_444361-510.jpg",
          "rating": 7.8,
          "releaseDate": "2025-04-20"
        },
        {
          "id": 2,
          "title": "TV Shows",
          "posterUrl": "https://img.freepik.com/free-vector/hand-drawn-talk-show-background_23-2149981113.jpg?semt=ais_hybrid&w=740",
          "rating": 6.5,
          "releaseDate": "2025-03-11"
        },
        {
          "id": 7,
          "title": "Movies",
          "posterUrl": "https://i0.wp.com/currentkick.com/wp-content/uploads/2022/03/windfall-review-netflix-thumbnail.jpg?fit=600%2C338&ssl=1",
          "rating": 8.1,
          "releaseDate": "2025-05-01"
        },
      ]
    },
    {
      "title": "Now Playing",
      "movies": [
        {
          "id": 1,
          "title": "The Last Frontier",
          "posterUrl": "https://image.tmdb.org/t/p/w500/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
          "rating": 7.8,
          "releaseDate": "2025-04-20"
        },
        {
          "id": 2,
          "title": "City of Shadows",
          "posterUrl": "https://image.tmdb.org/t/p/w500/6DrHO1jr3qVrViUO6s6kFiAGM7.jpg",
          "rating": 6.5,
          "releaseDate": "2025-03-11"
        },
        {
          "id": 7,
          "title": "Echoes of Eternity",
          "posterUrl": "https://image.tmdb.org/t/p/w500/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg",
          "rating": 8.1,
          "releaseDate": "2025-05-01"
        },
        {
          "id": 13,
          "title": "Battlefield 2025",
          "posterUrl": "https://image.tmdb.org/t/p/w500/5KCVkau1HEl7ZzfPsKAPM0sMiKc.jpg",
          "rating": 6.9,
          "releaseDate": "2025-04-10"
        },
        {
          "id": 14,
          "title": "Armageddon: Multiverse",
          "posterUrl": "https://image.tmdb.org/t/p/w500/6KErczPBROQty7QoIsaa6wJYXZi.jpg",
          "rating": 7.2,
          "releaseDate": "2025-04-15"
        }
      ]
    },
    {
      "title": "Top Rated",
      "movies": [
        {
          "id": 3,
          "title": "Legend of the Phoenix",
          "posterUrl": "https://image.tmdb.org/t/p/w500/5KCVkau1HEl7ZzfPsKAPM0sMiKc.jpg",
          "rating": 9.2,
          "releaseDate": "2024-09-18"
        },
        {
          "id": 4,
          "title": "Ocean's Code",
          "posterUrl": "https://image.tmdb.org/t/p/w500/6KErczPBROQty7QoIsaa6wJYXZi.jpg",
          "rating": 8.7,
          "releaseDate": "2024-12-25"
        },
        {
          "id": 8,
          "title": "The Silent Horizon",
          "posterUrl": "https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
          "rating": 9.0,
          "releaseDate": "2024-11-10"
        },
        {
          "id": 15,
          "title": "Sharknado: The Ultimate Disaster",
          "posterUrl": "https://image.tmdb.org/t/p/w500/2CAL2433ZeIihfX1Hb2139CX0pW.jpg",
          "rating": 8.5,
          "releaseDate": "2024-10-05"
        },
        {
          "id": 16,
          "title": "The Fantastic Four: First Steps",
          "posterUrl": "https://image.tmdb.org/t/p/w500/3P52oz9HPQWxcwHOwxtyrVV1LKi.jpg",
          "rating": 8.9,
          "releaseDate": "2024-09-22"
        }
      ]
    },
    {
      "title": "Coming Soon",
      "movies": [
        {
          "id": 5,
          "title": "Neon Skies",
          "posterUrl": "https://image.tmdb.org/t/p/w500/2CAL2433ZeIihfX1Hb2139CX0pW.jpg",
          "rating": null,
          "releaseDate": "2025-08-15"
        },
        {
          "id": 6,
          "title": "Void Runner",
          "posterUrl": "https://image.tmdb.org/t/p/w500/ynXoOxmDHNQ4UAy0oU6avW71HVW.jpg",
          "rating": null,
          "releaseDate": "2025-09-30"
        },
        {
          "id": 9,
          "title": "Starlight Chronicles",
          "posterUrl": "https://image.tmdb.org/t/p/w500/5BwqwxMEjeFtdknRV792Svo0K1v.jpg",
          "rating": null,
          "releaseDate": "2025-10-05"
        },
        {
          "id": 10,
          "title": "Quantum Drift",
          "posterUrl": "https://image.tmdb.org/t/p/w500/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg",
          "rating": null,
          "releaseDate": "2025-11-20"
        },
        {
          "id": 17,
          "title": "Mickey 17",
          "posterUrl": "https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg",
          "rating": null,
          "releaseDate": "2025-12-01"
        },
        {
          "id": 18,
          "title": "One of Them Days",
          "posterUrl": "https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
          "rating": null,
          "releaseDate": "2025-12-15"
        }
      ]
    },
    {
      "title": "Editor's Picks",
      "movies": [
        {
          "id": 11,
          "title": "Midnight Mirage",
          "posterUrl": "https://image.tmdb.org/t/p/w500/3P52oz9HPQWxcwHOwxtyrVV1LKi.jpg",
          "rating": 8.4,
          "releaseDate": "2025-07-22"
        },
        {
          "id": 12,
          "title": "Crimson Dusk",
          "posterUrl": "https://image.tmdb.org/t/p/w500/2TeJfUZMGolfDdW6DKhfIWqvq8y.jpg",
          "rating": 7.9,
          "releaseDate": "2025-06-18"
        },
        {
          "id": 19,
          "title": "Companion",
          "posterUrl": "https://image.tmdb.org/t/p/w500/5KCVkau1HEl7ZzfPsKAPM0sMiKc.jpg",
          "rating": 8.6,
          "releaseDate": "2025-07-10"
        },
        {
          "id": 20,
          "title": "Snow White",
          "posterUrl": "https://image.tmdb.org/t/p/w500/6KErczPBROQty7QoIsaa6wJYXZi.jpg",
          "rating": 8.8,
          "releaseDate": "2025-08-05"
        }
      ]
    },

  ]
};


const dummyLiveData = [
  {
    "id": 1,
    "name": "Lorri Warf",
    "followers": "12k Followers",
    "views": "1M",
    "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLCOpNz5mH1MpgYGnvZA8XwD1n1PJ-Zkd6eA&s"
  },
  {
    "id": 2,
    "name": "Bradley Lawlor",
    "followers": "15k Followers",
    "views": "2.1k",
    "image": "https://image.tmdb.org/t/p/w500/6DrHO1jr3qVrViUO6s6kFiAGM7.jpg"
  },
  {
    "id": 3,
    "name": "Kenthy Aleena",
    "followers": "1.5M Followers",
    "views": "12k",
    "image": "https://image.tmdb.org/t/p/w500/5KCVkau1HEl7ZzfPsKAPM0sMiKc.jpg"
  },
  {
    "id": 4,
    "name": "Iva & Ryan",
    "followers": "10k Followers",
    "views": "2.8k",
    "image": "https://marketplace.canva.com/EAFIarSHhpo/2/0/800w/canva-red-%26-blue-yellow-minimalist-sport-breaking-news-live-youtube-thumbnail-Z95F7TYFX2E.jpg"
  },
  {
    "id": 1,
    "name": "Lorri Warf",
    "followers": "12k Followers",
    "views": "1M",
    "image": "https://assets2.cbsnewsstatic.com/hub/i/r/2021/03/17/8943de62-3738-44bd-bac6-ba51d166b0c2/thumbnail/640x382/c692a4ad08ac58d766d8f07353bf059e/29-fave-tv-family-feud.jpg?v=48f078ae8a74a1412614b0db6f935e48"
  },
  {
    "id": 2,
    "name": "Bradley Lawlor",
    "followers": "15k Followers",
    "views": "2.1k",
    "image": "https://image.tmdb.org/t/p/w500/6DrHO1jr3qVrViUO6s6kFiAGM7.jpg"
  },
  {
    "id": 3,
    "name": "Kenthy Aleena",
    "followers": "1.5M Followers",
    "views": "12k",
    "image": "https://image.tmdb.org/t/p/w500/5KCVkau1HEl7ZzfPsKAPM0sMiKc.jpg"
  },
  {
    "id": 4,
    "name": "Iva & Ryan",
    "followers": "10k Followers",
    "views": "2.8k",
    "image": "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/262241418/original/94dca82578004690a903245c3629de2d671699a6/design-an-eye-catching-football-thumbnail-for-your-youtube-football-in-1-in-hour.jpg"
  }
];



final dummyLiveView = LiveViewModel(
  userName: 'Kate Sims',
  userImage: 'https://i.imgur.com/2yaf2wb.jpg',
  viewers: '2.5k',
  streamUrl: 'https://stream-akamai.castr.com/5b9352dbda7b8c769937e459/live_2361c920455111ea85db6911fe397b9e/index.fmp4.m3u8',
  comments: [
    LiveComment(name: 'Shane Floyd', message: 'Wow! guys where are you??'),
    LiveComment(name: 'Anita Shelam', message: 'Heyyy, you guys are having fun, ain’t ya!😄'),
    LiveComment(name: 'Patricia Sanders', message: 'I’m missing on a big treat!😅🍕'),
    LiveComment(name: 'James Hall', message: 'Oh, is that Sasha?! When did you guys meet??'),
    LiveComment(name: 'Mary Freund', message: 'Looks like a yummy pizza 😋'),
  ],
);


// Dummy comment list to load initially
final List<Comment> dummyComments = [
  Comment(
    id: '1',
    user: 'John Doe',
    text: 'Awesome content!',
    time: '2 hours ago',
    likes: 5,
    dislikes: 0,
    replies: [
      Comment(
        id: '1_1',
        user: 'Jane Doe',
        text: 'Totally agree!',
        time: '1 hour ago',
        likes: 2,
        dislikes: 0,
        replies: [],
      ),
    ],
  ),
  Comment(
    id: '2',
    user: 'Mike Ross',
    text: 'Loved it!',
    time: '1 day ago',
    likes: 3,
    dislikes: 1,
    replies: [],
  ),
  Comment(
    id: '1',
    user: 'John Doe',
    text: 'Awesome content!',
    time: '2 hours ago',
    likes: 5,
    dislikes: 0,
    replies: [
      Comment(
        id: '1_1',
        user: 'Jane Doe',
        text: 'Totally agree!',
        time: '1 hour ago',
        likes: 2,
        dislikes: 0,
        replies: [],
      ),
    ],
  ),
];

final List<MediaCategory> dummyCategories = [
  MediaCategory(
    title: "Popular Movies",
    items: [
      MediaItem(
        id: 1,
        title: "Inception",
        posterUrl: "https://image.tmdb.org/t/p/w500/glKDfE6btIRcVB5zrjspRIs4r52.jpg",
      ),
      MediaItem(
        id: 2,
        title: "The Dark Knight",
        posterUrl: "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
      ),
      MediaItem(
        id: 3,
        title: "Interstellar",
        posterUrl: "https://image.tmdb.org/t/p/w500/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg",
      ),
      MediaItem(
        id: 4,
        title: "The Matrix",
        posterUrl: "https://image.tmdb.org/t/p/w500/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg",
      ),
      MediaItem(
        id: 5,
        title: "Gladiator",
        posterUrl: "https://image.tmdb.org/t/p/w500/ty8TGRuvJLPUmAR1H1nRIsgwvim.jpg",
      ),
      MediaItem(
        id: 6,
        title: "Avengers: Endgame",
        posterUrl: "https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg",
      ),
    ],
  ),
  MediaCategory(
    title: "Popular TV Shows",
    items: [
      MediaItem(
        id: 7,
        title: "Breaking Bad",
        posterUrl: "https://image.tmdb.org/t/p/w500/ggFHVNu6YYI5L9pCfOacjizRGt.jpg",
      ),
      MediaItem(
        id: 8,
        title: "Game of Thrones",
        posterUrl: "https://image.tmdb.org/t/p/w500/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg",
      ),
      MediaItem(
        id: 9,
        title: "Stranger Things",
        posterUrl: "https://image.tmdb.org/t/p/w500/x2LSRK2Cm7MZhjluni1msVJ3wDF.jpg",
      ),
      MediaItem(
        id: 10,
        title: "The Mandalorian",
        posterUrl: "https://image.tmdb.org/t/p/w500/sWgBv7LV2PRoQgkxwlibdGXKz1S.jpg",
      ),
      MediaItem(
        id: 11,
        title: "The Crown",
        posterUrl: "https://image.tmdb.org/t/p/w500/mY7SeH4HFFxW1hiI6cWuwCRKptN.jpg",
      ),
      MediaItem(
        id: 12,
        title: "The Witcher",
        posterUrl: "https://image.tmdb.org/t/p/w500/zrPpUlehQaBf8YX2NrVrKK8IEpf.jpg",
      ),
    ],
  ),
  MediaCategory(
    title: "Trending Now",
    items: [
      MediaItem(
        id: 13,
        title: "The Queen's Gambit",
        posterUrl: "https://image.tmdb.org/t/p/w500/zU0htwkhNvBQdVSIKB9s6hgVeFK.jpg",
      ),
      MediaItem(
        id: 14,
        title: "Loki",
        posterUrl: "https://image.tmdb.org/t/p/w500/kEl2t3OhXc3Zb9FBh1AuYzRTgZp.jpg",
      ),
      MediaItem(
        id: 15,
        title: "WandaVision",
        posterUrl: "https://image.tmdb.org/t/p/w500/glKDfE6btIRcVB5zrjspRIs4r52.jpg",
      ),
      MediaItem(
        id: 16,
        title: "The Falcon and the Winter Soldier",
        posterUrl: "https://image.tmdb.org/t/p/w500/6kbAMLteGO8yyewYau6bJ683sw7.jpg",
      ),
      MediaItem(
        id: 17,
        title: "The Boys",
        posterUrl: "https://image.tmdb.org/t/p/w500/mY7SeH4HFFxW1hiI6cWuwCRKptN.jpg",
      ),
      MediaItem(
        id: 18,
        title: "Money Heist",
        posterUrl: "https://image.tmdb.org/t/p/w500/glKDfE6btIRcVB5zrjspRIs4r52.jpg",
      ),
    ],
  ),
  MediaCategory(
    title: "Popular Movies",
    items: [
      MediaItem(
        id: 1,
        title: "Inception",
        posterUrl: "https://image.tmdb.org/t/p/w500/glKDfE6btIRcVB5zrjspRIs4r52.jpg",
      ),
      MediaItem(
        id: 2,
        title: "The Dark Knight",
        posterUrl: "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
      ),
      MediaItem(
        id: 3,
        title: "Interstellar",
        posterUrl: "https://image.tmdb.org/t/p/w500/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg",
      ),
      MediaItem(
        id: 4,
        title: "The Matrix",
        posterUrl: "https://image.tmdb.org/t/p/w500/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg",
      ),
      MediaItem(
        id: 5,
        title: "Gladiator",
        posterUrl: "https://image.tmdb.org/t/p/w500/ty8TGRuvJLPUmAR1H1nRIsgwvim.jpg",
      ),
      MediaItem(
        id: 6,
        title: "Avengers: Endgame",
        posterUrl: "https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg",
      ),
    ],
  ),
  MediaCategory(
    title: "Popular TV Shows",
    items: [
      MediaItem(
        id: 7,
        title: "Breaking Bad",
        posterUrl: "https://image.tmdb.org/t/p/w500/ggFHVNu6YYI5L9pCfOacjizRGt.jpg",
      ),
      MediaItem(
        id: 8,
        title: "Game of Thrones",
        posterUrl: "https://image.tmdb.org/t/p/w500/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg",
      ),
      MediaItem(
        id: 9,
        title: "Stranger Things",
        posterUrl: "https://image.tmdb.org/t/p/w500/x2LSRK2Cm7MZhjluni1msVJ3wDF.jpg",
      ),
      MediaItem(
        id: 10,
        title: "The Mandalorian",
        posterUrl: "https://image.tmdb.org/t/p/w500/sWgBv7LV2PRoQgkxwlibdGXKz1S.jpg",
      ),
      MediaItem(
        id: 11,
        title: "The Crown",
        posterUrl: "https://image.tmdb.org/t/p/w500/mY7SeH4HFFxW1hiI6cWuwCRKptN.jpg",
      ),
      MediaItem(
        id: 12,
        title: "The Witcher",
        posterUrl: "https://image.tmdb.org/t/p/w500/zrPpUlehQaBf8YX2NrVrKK8IEpf.jpg",
      ),
    ],
  ),
  MediaCategory(
    title: "Trending Now",
    items: [
      MediaItem(
        id: 13,
        title: "The Queen's Gambit",
        posterUrl: "https://image.tmdb.org/t/p/w500/zU0htwkhNvBQdVSIKB9s6hgVeFK.jpg",
      ),
      MediaItem(
        id: 14,
        title: "Loki",
        posterUrl: "https://image.tmdb.org/t/p/w500/kEl2t3OhXc3Zb9FBh1AuYzRTgZp.jpg",
      ),
      MediaItem(
        id: 15,
        title: "WandaVision",
        posterUrl: "https://image.tmdb.org/t/p/w500/glKDfE6btIRcVB5zrjspRIs4r52.jpg",
      ),
      MediaItem(
        id: 16,
        title: "The Falcon and the Winter Soldier",
        posterUrl: "https://image.tmdb.org/t/p/w500/6kbAMLteGO8yyewYau6bJ683sw7.jpg",
      ),
      MediaItem(
        id: 17,
        title: "The Boys",
        posterUrl: "https://image.tmdb.org/t/p/w500/mY7SeH4HFFxW1hiI6cWuwCRKptN.jpg",
      ),
      MediaItem(
        id: 18,
        title: "Money Heist",
        posterUrl: "https://image.tmdb.org/t/p/w500/glKDfE6btIRcVB5zrjspRIs4r52.jpg",
      ),
    ],
  ),
];

final dummyPeople = [
  Person(
    name: 'Michael Carter',
    role: 'Director',
    imageUrl: 'https://i.pravatar.cc/150?img=3',
  ),
  Person(
    name: 'Emily Lopez',
    role: 'Cast',
    imageUrl: 'https://i.pravatar.cc/150?img=5',
  ),
  Person(
    name: 'John Doe',
    role: 'Cast',
    imageUrl: 'https://i.pravatar.cc/150?img=8',
  ),
  Person(
    name: 'Michael Carter',
    role: 'Director',
    imageUrl: 'https://i.pravatar.cc/150?img=3',
  ),
  Person(
    name: 'Emily Lopez',
    role: 'Cast',
    imageUrl: 'https://i.pravatar.cc/150?img=5',
  ),
  Person(
    name: 'John Doe',
    role: 'Cast',
    imageUrl: 'https://i.pravatar.cc/150?img=8',
  ),
];

final dummyEpisodes = [
  Episode(
    title: 'Episode 1',
    thumbnailUrl: 'https://picsum.photos/id/237/200/300',
    isSelected: true,
  ),
  Episode(
    title: 'Episode 2',
    thumbnailUrl: 'https://picsum.photos/id/238/200/300',
  ),
  Episode(
    title: 'Episode 3',
    thumbnailUrl: 'https://picsum.photos/id/239/200/300',
  ),
  Episode(
    title: 'Episode 4',
    thumbnailUrl: 'https://picsum.photos/id/240/200/300',
  ),
  Episode(
    title: 'Episode 5',
    thumbnailUrl: 'https://picsum.photos/id/241/200/300',
  ),
  Episode(
    title: 'Episode 6',
    thumbnailUrl: 'https://picsum.photos/id/242/200/300',
  ),
  Episode(
    title: 'Episode 7',
    thumbnailUrl: 'https://picsum.photos/id/243/200/300',
  ),
  Episode(
    title: 'Episode 8',
    thumbnailUrl: 'https://picsum.photos/id/244/200/300',
  ),
  Episode(
    title: 'Episode 9',
    thumbnailUrl: 'https://picsum.photos/id/241/200/300',
  ),
  Episode(
    title: 'Episode 10',
    thumbnailUrl: 'https://picsum.photos/id/237/200/300',
  ),
];

final dummyTrailers = [
  Trailer(
    title: 'Trailer 2: Final',
    duration: '1m 56s',
    thumbnailUrl: 'https://i.imgur.com/aD3HGpM.png',
    isSelected: true,
  ),
  Trailer(
    title: 'Trailer 1',
    duration: '1m 46s',
    thumbnailUrl: 'https://i.imgur.com/Ly9VZ5F.png',
  ),
];







