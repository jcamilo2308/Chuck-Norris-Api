import 'package:flutter/material.dart';
import '../Provider/Chuck_Provider.dart';
import 'package:chucknorris_api/Models/Model_Chuck.dart';
import 'package:card_swiper/card_swiper.dart';



class Swiper_Personalizado extends StatefulWidget {
  const Swiper_Personalizado({Key? key}) : super(key: key);

  @override
  State<Swiper_Personalizado> createState() => _Swiper_PersonalizadoState();
}

class _Swiper_PersonalizadoState extends State<Swiper_Personalizado> {
  late Future<List<ModelFrase>> _listadoFrases;

  @override
  void initState() {
    _listadoFrases = FraseProvider().getFrases();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late Future<List<ModelFrase>> _listadoFrases;
    _listadoFrases = FraseProvider().getFrases();
    return FutureBuilder<List<ModelFrase>>(
      future: _listadoFrases,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          return Expanded(
            child: Center(
              child: Swiper( //Usamos el widget Swiper para mostrar las frases
                  itemCount: snapshot.data!.length, //Cantidad de frases
                  itemWidth: 0.5, //Ancho de cada frase
                  onIndexChanged: (value) {
                    if (value == snapshot.data!.length - 8) { //Si el usuario llega al final de la lista de frases se cargan mas frases
                      final getprovider = FraseProvider();
                      getprovider.getFrases().then((value) {
                        setState(() {
                          _listadoFrases
                              .then((frases) => frases.addAll(value)); //Agregamos las nuevas frases a la lista de frases que ya teniamos y actualizamos el estado
                        });
                      });
                    }
                  },
                  itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 15, 20, 15), // se le dan separaciones de los bordes
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),// es una fincion para dare bordes redondos a las imagenes
                          child: Image(
                            image: NetworkImage(snapshot.data![index].iconUrl, ), // aqui se llama a la imagen
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 5, 20, 5),// se le dan separaciones de los bordes
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(20),// es una fincion para dare bordes redondos
                          color: const Color(0xff000000), // se le da el color de fondo al container
                        ) ,

                        child: Text(
                          textAlign: TextAlign.center, // alinea el texto al centro
                          snapshot.data![index].value, //Pasamos el texto de la frase al widget cardFrase
                        ),
                      ),
                    ],
                  )),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );



  }
}







