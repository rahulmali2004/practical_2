import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:practical_2/utils/MyGloballist.dart';
import 'package:practical_2/utils/MyRoutes.dart';
import 'package:practical_2/utils/splashscrren.dart';
import 'package:practical_2/views/scrren/addcontactpage.dart';
import 'package:practical_2/views/scrren/contactdetailpage.dart';
import 'package:practical_2/views/scrren/editcontactpage.dart';

import 'modals/Globals.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isGrid = false;
  bool isDark = false;
  double sliderval = 12;
  SliderComponentShape? myThumbshape = SliderComponentShape.noThumb;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigoAccent,
          foregroundColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      initialRoute: MyRoutes.SplashScreenPage,
      routes: {
        MyRoutes.add_contact: (context) => const add_contact(),
        MyRoutes.edit_contact: (context) => const edit_contact(),
        MyRoutes.contact_details: (context) => const contact_details(),
        MyRoutes.SplashScreenPage: (context) => const SplashScreenPage(),
        MyRoutes.homepage: (context) => Builder(
              builder: (context) {
                Size s = MediaQuery.of(context).size;
                return Scaffold(
                  appBar: AppBar(
                    title: const Text(
                      "HomePage",
                      style: TextStyle(fontSize: 20),
                    ),
                    centerTitle: true,
                    actions: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isDark = !isDark;
                          });
                        },
                        icon: Icon(isDark
                            ? Icons.light_mode_outlined
                            : Icons.dark_mode_outlined),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isGrid = !isGrid;
                          });
                        },
                        icon: Icon(isGrid ? Icons.list : Icons.grid_on),
                      ),
                    ],
                  ),
                  body: (Globals.allContacts.isNotEmpty)
                      ? Padding(
                          padding: const EdgeInsets.all(18),
                          child: Scrollbar(
                            interactive: true,
                            thickness: 10,
                            radius: const Radius.circular(50),
                            child: isGrid
                                ? GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 2 / 3,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5,
                                    ),
                                    itemCount: Globals.allContacts.length,
                                    itemBuilder: (context, index) => Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors
                                            .primaries[index % 18].shade200,
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://images.newindianexpress.com/uploads/user/imagelibrary/2018/6/21/w600X390/Krishna_Wants.jpg"),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.vertical(
                                                  top: Radius.circular(10),
                                                ),
                                                color: Colors
                                                    .primaries[index % 18]
                                                    .shade100,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.vertical(
                                                  bottom: Radius.circular(10),
                                                ),
                                                color: Colors
                                                    .primaries[index % 18]
                                                    .shade500,
                                              ),
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    Globals.allContacts[index]
                                                        .name,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: const Icon(
                                                      Icons.call,
                                                      size: 20,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Column(
                                    children: [
                                       Theme(
                                        data: ThemeData(
                                          useMaterial3: true,
                                          brightness: isDark
                                            ? Brightness.dark
                                              : Brightness.light,
                                          sliderTheme: SliderThemeData(
                                            thumbShape: myThumbshape,
                                            overlayShape:
                                              SliderComponentShape.noOverlay,
                                          )
                                        ),
                                         child: Slider(
                                           min: 0,
                                           max: Globals.allContacts.length.toDouble(),
                                           onChangeStart: (val){
                                             setState(() {
                                               myThumbshape = null;
                                             });
                                           },
                                           onChangeEnd: (val){
                                             setState(() {
                                               myThumbshape = SliderComponentShape.noOverlay;
                                             });
                                           },
                                           value: sliderval,
                                           onChanged: (val){
                                             setState(() {
                                               sliderval = val.toDouble();
                                             });
                                           },
                                         ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Expanded(
                                        flex: 13,
                                        child: ListView.builder(
                                          itemCount: Globals.allContacts.length,
                                          itemBuilder: (context, index) =>
                                              Slidable(
                                            closeOnScroll: true,
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              children: [
                                                SlidableAction(
                                                  onPressed: (val) {},
                                                  icon: Icons.call,
                                                  backgroundColor: Colors.green,
                                                ),
                                                SlidableAction(
                                                  onPressed: (val) async {
                                                    await Navigator.of(context)
                                                        .pushNamed(
                                                            MyRoutes
                                                                .edit_contact,
                                                            arguments: index);
                                                    setState(() {});
                                                  },
                                                  icon: Icons.edit,
                                                  backgroundColor: Colors.blue,
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              onTap: () async {
                                                await Navigator.of(context)
                                                    .pushNamed(
                                                        MyRoutes
                                                            .contact_details,
                                                        arguments: index);
                                                setState(() {});
                                              },
                                              leading: CircleAvatar(
                                                backgroundColor: Colors
                                                    .primaries[index % 18]
                                                    .shade200,
                                                foregroundImage: (Globals
                                                            .allContacts[index]
                                                            .image) !=
                                                        null
                                                    ? FileImage(Globals
                                                        .allContacts[index]
                                                        .image!)
                                                    : null,
                                                child: Text("${index + 1}"),
                                              ),
                                              title: Text(Globals
                                                  .allContacts[index].name),
                                              subtitle: Text(Globals
                                                  .allContacts[index].contact),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        )
                      : const Center(
                          child: Text(
                            "No contact display...",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () async {
                      await Navigator.of(context)
                          .pushNamed(MyRoutes.add_contact);
                      setState(() {});
                    },
                    child: const Icon(Icons.add),
                  ),
                );
              },
            ),
      },
    );
  }
}
