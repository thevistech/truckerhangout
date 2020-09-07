class Event {
  String name;
  String description;
  DateTime eventDate;
  String image;
  String location;
  String organizer;
  num price;

  Event({this.eventDate, this.image, this.location, this.name, this.organizer, this.price, this.description});
}

final List<Event> upcomingEvents = [
  Event(
    name: "Realtors Leadership Summit",
    eventDate: DateTime.now().add(const Duration(days: 24)),
    image: 'https://azizidevelopments.com/assets/images/banner/1511171604.jpg',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    location: "Fairview Gospel ",
    organizer: "Westfield Centre",
    price: 30,
  ),
  Event(
    name: "The Real Deal Events",
    eventDate: DateTime.now().add(const Duration(days: 33)),
    image: 'https://www.progressiveproperty.co.uk/wp-content/uploads/2017/06/property-networking-pp.jpg',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    location: "David Geffen Hall",
    organizer: "Westfield Centre",
    price: 30,
  ),
  Event(
    name: "NYC Real Estate Tech Week.",
    eventDate: DateTime.now().add(const Duration(days: 12)),
    image: 'https://www.bsgproperty.com/images/event/BSG-Property-Roadshow-QBM/BSG-Property-Roadshow-QBM-03.jpg',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    location: "The Cutting room",
    organizer: "Westfield Centre",
    price: 30,
  ),
];

final List<Event> nearbyEvents = [
  Event(
    name: "BUILDEX Vancouver",
    eventDate: DateTime.now().add(const Duration(days: 1)),
    image: 'https://www.propertyhunter.com.my/transfer/181110145556sheda.jpg',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    location: "Fairview Gospel",
    organizer: "Westfield Centre",
    price: 30,
  ),
  Event(
    name: "NYC Real Estate Tech Week",
    eventDate: DateTime.now().add(const Duration(days: 4)),
    image: 'https://gulfbusiness.com/wp-content/uploads/2017/04/Cityscape-damac.jpg',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    location: "David Geffen Hall",
    organizer: "Westfield Centre",
    price: 30,
  ),
  Event(
    name: "RECon",
    eventDate: DateTime.now().add(const Duration(days: 2)),
    image: 'https://i2-prod.business-live.co.uk/enterprise/article17931091.ece/ALTERNATES/s615/1_TJR_BPO_200316chamberawards_01JPG.jpg',
    description: "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    location: "The Cutting room",
    organizer: "Westfield Centre",
    price: 30,
  ),
  Event(
    name: "Realtors Leadership Summit",
    eventDate: DateTime.now().add(const Duration(days: 21)),
    image: 'https://si.wsj.net/public/resources/images/BN-EQ477_dubaic_G_20140922024018.jpg',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    location: "The Cutting room",
    organizer: "Westfield Centre",
    price: 32,
  ),
  Event(
    name: "Real Estate Cfo Forum",
    eventDate: DateTime.now().add(const Duration(days: 16)),
    image: 'https://d1y8sb8igg2f8e.cloudfront.net/images/FPR_Frontier_About_Page_Photo_2.width-600.jpg',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    location: "David Field",
    organizer: "Westfield Centre",
    price: 14,
  ),
];
