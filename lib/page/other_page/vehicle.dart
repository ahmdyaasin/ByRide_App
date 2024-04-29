class VehiclesItem {
  final String title;
  final double price;
  final String path;
  final String color;
  final String gearbox;
  final String fuel;
  final String brand;

  VehiclesItem(
    {required this.title,
    required this.price,
    required this.path,
    required this.color,
    required this.gearbox,
    required this.fuel,
    required this.brand});
}

VehiclesList allVehicles = VehiclesList(vehicle: [
  VehiclesItem(
    title: 'Honda Civic 2018',
    price: 123,
    color: 'Dark Grey',
    gearbox: '4',
    fuel: '4L',
    brand: 'Honda',
    path: 'asstes/images/honda_city_front.jpg'
  ),
    VehiclesItem(
    title: 'Axia 2017',
    price: 123,
    color: 'Red',
    gearbox: '2',
    fuel: '4L',
    brand: 'Perodua',
    path: 'asstes/images/honda_city_front.jpeg'
  ),
      VehiclesItem(
    title: 'Saga 2015',
    price: 123,
    color: 'Black',
    gearbox: '2',
    fuel: '4L',
    brand: 'Proton',
    path: 'asstes/images/saga_front.jpg'
  ),
  VehiclesItem(
    title: 'Myvi 2020',
    price: 123,
    color: 'Black',
    gearbox: '3',
    fuel: '4L',
    brand: 'Perdodua',
    path: 'asstes/images/myvi_front.jpg'
  ),
]);

class VehiclesList {
  List<VehiclesItem> vehicle;
  
  VehiclesList({required this.vehicle});
}