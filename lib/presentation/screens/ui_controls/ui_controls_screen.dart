import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UI Controls'),
        ),
        body: const _UicontrolsView());
  }
}

class _UicontrolsView extends StatefulWidget {
  const _UicontrolsView();

  @override
  State<_UicontrolsView> createState() => _UicontrolsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UicontrolsViewState extends State<_UicontrolsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBrakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(physics: const ClampingScrollPhysics(), children: [
      SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
                isDeveloper = !isDeveloper;
              })),
      ExpansionTile(
        title: const Text('Vehículo de traporte'),
        subtitle: Text('$selectedTransportation'),
        children: [
          RadioListTile(
            title: const Text('By Car'),
            subtitle: const Text('Travel by car'),
            value: Transportation.car,
            groupValue: selectedTransportation,
            onChanged: (value) => setState(() {
              selectedTransportation = Transportation.car;
            }),
          ),
          RadioListTile(
            title: const Text('By Boat'),
            subtitle: const Text('Travel by boat'),
            value: Transportation.boat,
            groupValue: selectedTransportation,
            onChanged: (value) => setState(() {
              selectedTransportation = Transportation.boat;
            }),
          ),
          RadioListTile(
            title: const Text('By Plane'),
            subtitle: const Text('Travel by plane'),
            value: Transportation.plane,
            groupValue: selectedTransportation,
            onChanged: (value) => setState(() {
              selectedTransportation = Transportation.plane;
            }),
          ),
          RadioListTile(
            title: const Text('By Submarine'),
            subtitle: const Text('Travel by submarine'),
            value: Transportation.submarine,
            groupValue: selectedTransportation,
            onChanged: (value) => setState(() {
              selectedTransportation = Transportation.submarine;
            }),
          ),
        ],
      ),

      CheckboxListTile(
        title: const Text('Desayuno'),
        value: wantsBrakfast, 
        onChanged: (value) => setState(() {
          wantsBrakfast = !wantsBrakfast;
        })
      ),
      CheckboxListTile(
        title: const Text('Almuerzo'),
        value: wantsLunch, 
        onChanged: (value) => setState(() {
          wantsLunch = !wantsLunch;
        })
      ),
      CheckboxListTile(
        title: const Text('Cena'),
        value: wantsDinner, 
        onChanged: (value) => setState(() {
          wantsDinner = !wantsDinner;
        })
      ),
    
    ]);
  }
}
