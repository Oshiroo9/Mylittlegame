import 'dart:io';

String lerTextoUsuario(String mensagem) {
  stdout.write(mensagem);
  return stdin.readLineSync()!;
}

void mostrarMensagemUsuario(String mensagem) {
  print(mensagem);
}

class Employee {
  String jogador = "";
  String cor = "";
  int life = 100;
  List<String> itenss = [];
}

class Bug {
  int life = 40;
  int attack = 20;
  List stolen = [];
}

class itens {
  int price = 0;
  String name = "";
  int attack = 0;
  int heal = 0;
  itens();
}

void main(List<String> args) {
  String sim = "sim";
  //dinheiro do player
  itens moneyy = itens();
  moneyy.price = 60;
  moneyy.name = 'Money';
  //itens de dano
  itens item2 = itens();
  item2.price = 12;
  item2.name = "Shovel";
  item2.attack = 20;

  itens item3 = itens();
  item3.name = "Flashlight";
  item3.price = 5;
  item3.attack = 5;

  itens item4 = itens();
  item4.name = "Pro-Flashlight";
  item4.price = 15;
  item4.attack = 15;

  itens item5 = itens();
  item5.name = "Stun Granade";
  item5.price = 18;
  item5.attack = 30;

  itens item6 = itens();
  item6.name = "Toilet";
  item6.price = 50;
  item6.attack = 50;
  //itens de cura
  itens item1 = itens();
  item1.price = 30;
  item1.name = "BoomBox";
  item1.heal = 25;

  itens item7 = itens();
  item7.name = "Walkie-Tokie";
  item7.price = 10;
  item7.heal = 10;

  itens item8 = itens();
  item8.name = "CheeseBurguer";
  item8.price = 10;
  item8.heal = 15;
  List items = [];

  items.add(item1);
  items.add(item2);
  items.add(item3);
  items.add(item4);
  items.add(item5);
  items.add(item6);
  items.add(item7);

  //intro
  Employee ite = Employee();
  Employee newEmployee = Employee();
  String talvez = "yes";
  while (sim == "sim") {
    newEmployee.jogador =
        lerTextoUsuario("THE COMPANY NEEDS YOU!\nHow are you called?: ");
    newEmployee.cor = lerTextoUsuario("What are your favorite colour?: ");
    while (talvez == "yes") {
      String itemName = lerTextoUsuario(
          "Welcome to the shop!\n\nHeal Itens:\n\n${item1.name} ${item1.price}\n${item7.name} ${item7.price}\n${item8.name} ${item8.price}\n\nDamage Itens:\n\n${item2.name} ${item2.price}\n${item3.name} ${item3.price}\n${item4.name} ${item4.price}\n${item5.name} ${item5.price}\n${item6.name} ${item6.price}\n\nYour ${moneyy.name} ${moneyy.price}\n");
      for (itens item in items) {
        if (item.name == itemName) {
          moneyy.price = moneyy.price - item.price;
          ite.itenss.add(itemName);
          if (moneyy.price < 0) {
            moneyy.price += item.price;
            ite.itenss.remove(ite.itenss.last);
            mostrarMensagemUsuario("You can't afford for this.");
          }
        }
      }
      talvez = lerTextoUsuario("Do you want to visit the shop again? yes/no: ");
    }
    mostrarMensagemUsuario(
        "\nEMPLOYEE: ${newEmployee.jogador}\nFavorite color: ${newEmployee.cor}");
    mostrarMensagemUsuario("Money: ${moneyy.price}\nIventory: ${ite.itenss}");
    sim = lerTextoUsuario("Press =Enter= to start.");
  }
  //primeiro inimigo
  Bug hoardingBug = Bug();
  mostrarMensagemUsuario("\nFirst moon\n41 - Experimentation - Risk level =B=");
  lerTextoUsuario("\nPress =Enter= to enter the building");
  mostrarMensagemUsuario("\nYou found a Hoarding Bug!");
  mostrarMensagemUsuario(
      "\nHoarding Bug:${hoardingBug.life}\n${newEmployee.jogador}:${ite.life}");
  //primeiro turno do player
  String itemUsed =
      lerTextoUsuario("What do you want to use?\n${ite.itenss}\n");

  lerTextoUsuario("\n\nPress =Enter= to use it!");
  for (itens itemUs in items) {
    if (itemUs.name == itemUsed) {
      if (itemUs.attack > 0) {
        // item de dano
        hoardingBug.life = hoardingBug.life - itemUs.attack; // atacar inimigo
        if (itemUs == item6) {
          lerTextoUsuario(
              "A head comes out of the toilet singing *Brr skibidi dop dop dop yes yes*");
        }
        lerTextoUsuario("You deal't ${itemUs.attack} damage");
        mostrarMensagemUsuario(
            "\nHoarding Bug:${hoardingBug.life}\n${newEmployee.jogador}:${ite.life}");
      }
      if (itemUs.heal > 0) {
        String choice = lerTextoUsuario(
            "Who do you want to use it on? ${newEmployee.jogador}/Hoarding Bug\n");
        if (choice == newEmployee.jogador) {
          // curar player
          ite.life = ite.life + itemUs.heal;
          if (ite.life > 100) {
            ite.life = ite.life - itemUs.heal;
            lerTextoUsuario("${newEmployee.jogador} is with full Health");
          }
          lerTextoUsuario(
              "${newEmployee.jogador} healed ${itemUs.attack} damage");
        } else if (choice == "Hoarding Bug") {
          // curar inimigo
          hoardingBug.life = hoardingBug.life + itemUs.heal;
          if (hoardingBug.life > 100) {
            hoardingBug.life = hoardingBug.life - itemUs.heal;
            lerTextoUsuario("Hoarding Bug its full Health.");
          }
          lerTextoUsuario(
              "${newEmployee.jogador} healed ${itemUs.attack} damage from Hoarding Bug.");
        }
        mostrarMensagemUsuario(
            "\nHoarding Bug:${hoardingBug.life}\n${newEmployee.jogador}:${ite.life}");
      }
    }
  }
  // fim do primeiro turno

  //inicio do segundo turno do inimigo
}
