import 'package:aluno/app/presentation/views/utils/app_appbar.dart';
import 'package:aluno/app/presentation/views/utils/app_launch.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  var moduleChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: const Text('cursoNome'),
        actions: [
          IconButton(
              onPressed: () => AppLaunch.launch('https://discord.com'),
              icon: const Icon(
                Icons.discord,
                size: 40,
              ))
        ],
      ),
      body: ListView(
        children: [
          modulo(
            name: 'modulo 1',
            aula: 'aula 1',
            imageCourse:
                'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/cdec4477b1e99e9b98fb45f8be00ac1b_ventosa.jpg',
            imageCoord:
                'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
            imageProf:
                'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
          ),
          modulo(
            name: 'modulo 1',
            aula: 'aula 2',
            imageCourse:
                'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/cdec4477b1e99e9b98fb45f8be00ac1b_ventosa.jpg',
            imageCoord:
                'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
            imageProf:
                'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
          ),
        ],
      ),
    );
  }

  Card modulo({
    required String name,
    required String aula,
    required String imageCourse,
    required String imageCoord,
    required String imageProf,
  }) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(0),
                ),
                child: Image.network(
                  imageCourse,
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      aula,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'É um curso bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text('Equipe:'),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Tooltip(
                                  message: 'Coord.: nomeCoordenador(a)',
                                  child: Image.network(
                                    imageCoord,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Tooltip(
                                  message: 'Prof(a).: nomeProfessora',
                                  child: Image.network(
                                    imageProf,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    moduleChecked = !moduleChecked;
                  });
                },
                icon: Icon(moduleChecked
                    ? Icons.check_box_outlined
                    : Icons.check_box_outline_blank),
              ),
              IconButton(
                onPressed: () => AppLaunch.launch(
                    'https://drive.google.com/drive/folders/1ON1pBql5EvaPx1RXFH8SGm9Uy8VC4T76?usp=sharing'),
                icon: const Icon(Icons.folder),
              ),
              IconButton(
                onPressed: () =>
                    AppLaunch.launch('https://youtu.be/_2bDOCTnbKc'),
                icon: const Icon(Icons.ondemand_video),
              )
            ],
          )
        ],
      ),
    );
  }
}
