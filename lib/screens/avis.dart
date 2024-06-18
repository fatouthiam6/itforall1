
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readmore/readmore.dart';
import 'package:solideat_projet/screens/accueil.dart';
import 'package:solideat_projet/screens/login.dart';
import 'package:solideat_projet/screens/settings.dart';
import 'package:solideat_projet/screens/spam.dart';




class Avis extends StatefulWidget {
  const Avis({super.key});

  @override
  State<Avis> createState() => _AvisState();
}

class _AvisState extends State<Avis> {
  int selectedButtonIndex = -1;
  List<bool> isButtonSelectedList = [false, false, false,false];
  bool showFullText = false;
  bool showReplyTextField = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
appBar: AppBar(
        title: Text(
          'Avis',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(178, 230, 137, 180),
        centerTitle: true,
        leading: GestureDetector(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5, top: 5.0),
                child: Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 43,
                ),
              ),
              Positioned(
                left: 15,
                bottom: 19,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        
            
              child: _buildInfoEntreprise(),
            
          ),
          bottomNavigationBar: BottomAppBar(
  color: const Color.fromARGB(178, 230, 137, 180), // Couleur de fond
  elevation: 10, // Élévation pour donner une impression de profondeur
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Alignement des éléments
    children: <Widget>[
      IconButton(
        icon: Icon(Icons.menu, size: 30, color: Colors.white), 
        onPressed: () {
            Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => accueilPage()),
    );
         
        },
      ),
      IconButton(
        icon: Icon(Icons.event, color: Colors.white), 
        onPressed: () {
            Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
        },
      ),
      IconButton(
        icon: Icon(Icons.settings, size: 30, color: Colors.white), 
        onPressed: () {
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
        },
      ),
    ],
  ),
),


    );
      
    
  }


  Widget _buildInfoEntreprise() {

String content = 'hbjnbhvgcgffdxcvbnbnvbcb,b,vcbbn,;bvcxn,bvvbn,bvcnvbvcvhbhjgfdgfhjgfdsghjjbvcxv bbvcbcbbvn,bvcxcvbn,bvcxvbn,;bvcxn,bvcxcvhgcgvccvnj;hjgfdxfcghvbjknhgfdswfgfghvjklhgfdsfwfxcvbnhbvgfdsgvbxsgfdfvhjsgfdxhhjsgfsdrtjhjhghxvcgss';
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          
          
          
        
          const SizedBox(
            height: 15,
          ),
          
         
        
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Trier les avis',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 19,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isButtonSelectedList = [true, false, false,false];
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(), backgroundColor: isButtonSelectedList[0] ? Colors.orange : Colors.white,
                    side: const BorderSide(color: Colors.grey, width: 1),
                  ),
                  child: const Text('Les meilleurs'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isButtonSelectedList = [false, true, false,false];
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(), backgroundColor: isButtonSelectedList[1] ? Colors.orange : Colors.white,
                    side: const BorderSide(color: Colors.grey, width: 1),
                  ),
                  child: const Text('Les moins bons'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isButtonSelectedList = [false, false, true,false];
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(), backgroundColor: isButtonSelectedList[2] ? Colors.orange : Colors.white,
                    side: const BorderSide(color: Colors.grey, width: 1),
                  ),
                  child: const Text('Plus récent'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isButtonSelectedList = [false, false, false,true];
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(), backgroundColor: isButtonSelectedList[3] ? Colors.orange : Colors.white,
                  side: const BorderSide(color: Colors.grey, width: 1),
                ),
                child: const Text('Plus ancien'),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3), 
      ),
    ],
  ),
  padding: EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Ajouter un commentaire :',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.black87,
        ),
      ),
      SizedBox(height: 12),
      TextField(
        decoration: InputDecoration(
          hintText: 'Ajouter un commentaire...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
      SizedBox(height: 16),
      ElevatedButton(
        onPressed: () {
          // Logique pour soumettre le commentaire ici
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'Envoyer',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  ),
),
const SizedBox(height: 40,),

          SingleChildScrollView(
            
           // child: Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/nourriture.jpg',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amanda W',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 16,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '11/07/2023',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),

                    Row(
                      children: [
                        const Text(
                          'Avis',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Image.asset(
                          'assets/icon-google.png',
                          width: 60,
                          height: 90,
                        ),
                      ],
                    ),


                ],
              ),

          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReadMoreText(
                  content,
                  trimLines: 3,
                  textAlign: TextAlign.justify,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "Plus",
                  trimExpandedText: "  Moins",
                  lessStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  moreStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.orange,
                  ),
                  style: const TextStyle(
                    // Définir l'espacement entre les lignes ici
                    height: 2, // Augmentez cette valeur pour augmenter l'espacement
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: SingleChildScrollView(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.8, 
                                  height: 700, 
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                     
                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 10),
                                            child: Center(
                                              child: Text(
                                                "Signaler",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () {
                                              // Mettez ici la logique pour fermer l'alerte sans rien faire
                                              Navigator.of(context).pop();
                                            },
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      const Divider(
                                        color: Colors.orangeAccent,
                                        height: 1,
                                        thickness: 1,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Veuillez sélectionner une raison",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Veuillez indiquer la raison de votre signalement",
                                                softWrap: true, // Permet au texte de passer à la ligne si nécessaire
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      buildListItem("Spam", Colors.black, context),
                                      buildListItem("Discours haineux", Colors.black, context),
                                      buildListItem("Vente non autorisées", Colors.black, context),
                                      buildListItem("Fausses informations", Colors.black, context),
                                      buildListItem("Harcèlement", Colors.black, context),
                                      buildListItem("Violence", Colors.black, context),
                                      buildListItem("Autre chose", Colors.black, context),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Center(
                        child: Text(
                          "Signaler",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          // Bascule de la variable booléenne pour afficher/masquer le TextField
                          showReplyTextField = !showReplyTextField;
                        });
                      },
                      child: const Text(
                        "Répondre",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                if (showReplyTextField) ...[
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 100, // Hauteur du TextField de réponse
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10), // Bordure arrondie orange
                              border: Border.all(color: Colors.orange, width: 1), // Bordure orange
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextField(
                                // Propriétés supplémentaires pour le TextField de réponse
                                decoration: InputDecoration(
                                  hintText: "Votre réponse...",
                                  border: InputBorder.none, // Pas de bordure pour le TextField
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10), // Espacement entre le TextField et l'image
                      InkWell(
                        onTap: () {
                          // Implémentez votre logique lorsque l'utilisateur clique sur l'image
                          setState(() {
                            showReplyTextField = false;
                          });
                        },
                        child: Image.asset(
                          'assets/envoyer.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],



              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SingleChildScrollView(
            // child: Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/nourriture.jpg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Paul B',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '11/07/2023',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),

                const Row(
                  children: [
                    Text(
                      'Avis',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                   
                  ],
                ),


              ],
            ),

          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReadMoreText(
                  content,
                  trimLines: 3,
                  textAlign: TextAlign.justify,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "Plus",
                  trimExpandedText: "  Moins",
                  lessStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  moreStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.orange,
                  ),
                  style: const TextStyle(
                    // Définir l'espacement entre les lignes ici
                    height: 2, // Augmentez cette valeur pour augmenter l'espacement
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              children: [
                InkWell(
                  child: const Text("Signaler",style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                  ),),
                  onTap: (){
                  },
                ),
                const SizedBox(
                  width: 26,
                ),
                const Text("Répondre",style:   TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.orange,
                ),),



              ],
            ),
          ),



        ],
      ),

    );
  }
  Widget buildListItem(String text, Color textColor, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.1),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              switch (text) {
                case "Spam":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Spam()),
                  );
                  break;
                case "Discours haineux":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                  break;
                case "Vente non autorisées":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                  break;
                case "Fausses informations":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                  break;
                case "Harcèlement":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                  break;
                case "Violence":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                  break;
                case "Autre chose":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  LoginPage()),
                  );
                  break;

                default:
                // If the item doesn't match any specific case, do nothing.
                  break;
              }
            },
            child: ListTile(
              title: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: textColor,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey[600],
              ),
            ),
          ),
          const Divider(
            color: Colors.black54,
            thickness: 1,
          ),
        ],
      ),
    );
  }


}
