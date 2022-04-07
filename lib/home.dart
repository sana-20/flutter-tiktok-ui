import 'package:flutter/material.dart';
import 'package:tiktok/video_player_item.dart';
import 'package:tiktok/data_json.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var like = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: user.length,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    child: VideoPlayerItem(videoUrl: user[index]['videoUrl']),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 25, left: 10),
                        alignment: Alignment.bottomLeft,
                        width: MediaQuery.of(context).size.width - 110,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              user[index]['name'],
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                                child: Text(
                              user[index]['description'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ))
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              child: Stack(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                user[index]['image'])),
                                        border: Border.all(
                                            width: 2, color: Colors.white),
                                        color: Colors.orange,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(
                                        top: 39.5, left: 14.5),
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Text(
                                      '+',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 70,
                              height: 70,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        like = !like;
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      width: 50,
                                      height: 50,
                                      child: Icon(
                                        Icons.favorite,
                                        size: 50,
                                        color:
                                            !like ? Colors.white : Colors.pink,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      user[index]['like'],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 70,
                              height: 70,
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 50,
                                    height: 50,
                                    child: const Icon(
                                      Icons.comment,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      user[index]['comment'],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 70,
                              height: 70,
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 50,
                                    height: 50,
                                    child: const Icon(
                                      Icons.reply,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      user[index]['share'],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          user[index]['music_Image']),
                                      fit: BoxFit.fill),
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(40)),
                            ),
                          ],
                        ),
                      ),
                      // music image
                    ],
                  ),
                ],
              );
            },
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '팔로잉',
                  style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '추천',
                  style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 55, right: 10),
            alignment: Alignment.topRight,
            child: const Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  '홈',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  '탐색',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                SizedBox(
                  width: 42,
                  height: 28,
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 4,
                        ),
                        width: 38,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                            255,
                            250,
                            45,
                            108,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 4,
                        ),
                        width: 38,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                            255,
                            32,
                            211,
                            234,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: double.infinity,
                          width: 36,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Text(
                  '만들기',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.message,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  '알림',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.person_outline,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  '프로필',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
