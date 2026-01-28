import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _HomePageState();
}

class _HomePageState extends State<homePage> {
  // List to hold our video data
  List<Map<String, String>> _videos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchVideosFromBackend();
  }

  // --- API CALL LOGIC ---
  Future<void> _fetchVideosFromBackend() async {
    // 1. In a real app, you would import http package: import 'package:http/http.dart' as http;
    // 2. Define your endpoint: var url = Uri.parse('https://your-api.com/videos');

    try {
      // 3. Make the request:
      // var response = await http.get(url);

      // 4. Check status and decode:
      // if (response.statusCode == 200) {
      //   final List<dynamic> data = json.decode(response.body);
      //   setState(() {
      //     _videos = data.map((e) => VideoModel.fromJson(e)).toList();
      //     _isLoading = false;
      //   });
      // }

      // --- SIMULATING API DELAY FOR DEMO ---
      await Future.delayed(const Duration(seconds: 2));

      // Dummy Data
      setState(() {
        _videos = List.generate(
          12,
          (index) => {
            "title": "Flutter Tutorial Part ${index + 1}",
            "views": "${(index + 1) * 5}K views",
            "duration": "10:${index + 10}",
          },
        );
        _isLoading = false;
      });
    } catch (e) {
      debugPrint("Error fetching data: $e");
      // Handle error state here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Locker"),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(0, 0, 0, 0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      // LayoutBuilder is crucial here: it tells us the parent's width
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.black,
                color: Colors.white,
              ),
            )
          : LayoutBuilder(
              builder: (context, constraints) {
                double screenWidth = constraints.maxWidth;
                int columns;

                // --- RESPONSIVE LOGIC ---
                if (screenWidth < 600) {
                  columns = 1; // Mobile (Portrait)
                } else if (screenWidth < 1100) {
                  columns = 2; // Tablet / Horizontal Mobile
                } else {
                  columns = 3; // Laptop / Desktop
                }

                // Calculate exact width for each card based on columns
                // We subtract a little spacing to prevent overflow if you add margins later
                double itemWidth = screenWidth / columns;

                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  child: SingleChildScrollView(
                    child: Wrap(
                      // Wrap alignment
                      alignment: WrapAlignment.start,
                      children: _videos.map((video) {
                        return SizedBox(
                          width: itemWidth,
                          child: _VideoCard(
                            title: video["title"]!,
                            duration: video["duration"]!,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

// --- CUSTOM VIDEO CARD WIDGET ---
class _VideoCard extends StatelessWidget {
  final String title;
  final String duration;

  const _VideoCard({required this.title, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 0, 0, 0),
      margin: const EdgeInsets.all(8.0),
      elevation: 4,
      clipBehavior: Clip.antiAlias, // Ensures the ripple doesn't spill out
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        // <--- Replaces ElevatedButton
        onTap: () {
          debugPrint("Video '$title' tapped!");
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // 1. Thubnail with Duration Badge
            Stack(
              children: [
                // main video thimbnail Container
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Thumbnail.png'),
                      fit: BoxFit.cover,
                    ),
                    // color: Color.fromARGB(31, 0, 38, 153), // Placeholder color
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                ),

                // Duration Badge
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      duration,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 3,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis, // <--- Added this
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Thumbnail code : 
/*Stack(
    children: [
      // main video thimbnail Container
      Container(
        height: 180,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Thumbnail.png'),
            fit: BoxFit.cover,
          ),
          // color: Color.fromARGB(31, 0, 38, 153), // Placeholder color
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
        ),
      ),

      // Duration Badge
      Positioned(
        bottom: 8,
        right: 8,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            duration,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    ],
  ),
*/
// Old code :

// import 'package:flutter/material.dart';

// class homePage extends StatelessWidget {
//   const homePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
      
//     );
//   }
// }