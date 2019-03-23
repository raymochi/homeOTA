import 'package:google_maps_flutter/google_maps_flutter.dart';

Set<Marker> markers = new Set.from([
  Marker(
      markerId: MarkerId('0'),
      position: LatLng(43.66014526, -79.37840775),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'St. Vincent De Paul - Mary\'s Home',
        snippet: '70 Gerrard St E',
      ),
    ),

    Marker(
      markerId: MarkerId('1'),
      position: LatLng(43.79810881, -79.39544085),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'St. Vincent De Paul - St. Clare\'s Residence',
        snippet: '3410 Bayview Ave',
      ),
    ),

    Marker(
      markerId: MarkerId('2'),
      position: LatLng(43.65924255, -79.37242958),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Street Haven at the Crossroads',
        snippet: '87 Pembroke St',
      ),
    ),

    Marker(
      markerId: MarkerId('3'),
      position: LatLng(43.64874717, -79.39323797),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Streets to Homes Assessment & Referral Centre',
        snippet: '129 Peter St',
      ),
    ),

    Marker(
      markerId: MarkerId('4'),
      position: LatLng(43.67361705, -79.40628402),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Toronto Community Hostel',
        snippet: '191 Spadina Rd',
      ),
    ),

    Marker(
      markerId: MarkerId('5'),
      position: LatLng(43.69092854, -79.34965193),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Touchstone Youth Shelter',
        snippet: '1076 Pape Ave',
      ),
    ),

    Marker(
      markerId: MarkerId('6'),
      position: LatLng(43.6658642, -79.37921523),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Turning Point Youth Services',
        snippet: '95 Wellesley St E',
      ),
    ),

    Marker(
      markerId: MarkerId('7'),
      position: LatLng(43.65205191, -79.39147427),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'University Settlement - Part time Shelter',
        snippet: '23 Grange Rd',
      ),
    ),

    Marker(
      markerId: MarkerId('8'),
      position: LatLng(43.64801553, -79.41137489),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Women\'s Residence - Bellwoods House',
        snippet: '63 Bellwoods Ave',
      ),
    ),

    Marker(
      markerId: MarkerId('9'),
      position: LatLng(43.65197881, -79.40369147),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Women\'s Residence - Main Site',
        snippet: '674 Dundas St W',
      ),
    ),

    Marker(
      markerId: MarkerId('10'),
      position: LatLng(43.66013791, -79.34307998),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Woodgreen Red Door Queen',
        snippet: '875 Queen St E',
      ),
    ),

    Marker(
      markerId: MarkerId('11'),
      position: LatLng(43.64818818, -79.39800551),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'YMCA House',
        snippet: '485 Queen St W',
      ),
    ),

    Marker(
      markerId: MarkerId('12'),
      position: LatLng(43.7362974, -79.58047917),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Youth Without Shelter',
        snippet: '6 Warrendale Crt',
      ),
    ),

    Marker(
      markerId: MarkerId('13'),
      position: LatLng(43.68479084, -79.38971414),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'YWCA - First Stop Woodlawn Youth Unit',
        snippet: '80 Woodlawn Ave E',
      ),
    ),

    Marker(
      markerId: MarkerId('14'),
      position: LatLng(43.68479084, -79.38971414),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'YWCA - First Stop Woodlawn - Women\'s Unit',
        snippet: '80 Woodlawn Ave E',
      ),
    ),

    Marker(
      markerId: MarkerId('15'),
      position: LatLng(43.68089023, -79.45666285),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'YWCA - Beatrice House',
        snippet: '177 Caledonia Rd',
      ),
    ),

    Marker(
      markerId: MarkerId('17'),
      position: LatLng(43.76830921, -79.26742674),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Birkdale Residence',
        snippet: '1229 Ellesmere Rd',
      ),
    ),

    Marker(
      markerId: MarkerId('18'),
      position: LatLng(43.66517138, -79.4188548),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Christie Refugee Welcome Centre',
        snippet: '43 Christie St',
      ),
    ),

    Marker(
      markerId: MarkerId('19'),
      position: LatLng(43.66618387, -79.44591198),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Christie-Ossington Men\'s Shelter',
        snippet: '973 Lansdowne Ave',
      ),
    ),

    Marker(
      markerId: MarkerId('20'),
      position: LatLng(43.68012691, -79.43170539),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Cornerstone Place',
        snippet: '833 St Clair Ave W',
      ),
    ),

    Marker(
      markerId: MarkerId('21'),
      position: LatLng(43.65766597, -79.40716605),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Costi Reception Centre',
        snippet: '100 Lippincott St',
      ),
    ),

    Marker(
      markerId: MarkerId('22'),
      position: LatLng(43.65950349, -79.38143531),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Covenant House',
        snippet: '20 Gerrard St E',
      ),
    ),

    Marker(
      markerId: MarkerId('23'),
      position: LatLng(43.68929737, -79.29835808),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Dixon Hall - Heyworth House',
        snippet: '2714 Danforth Ave',
      ),
    ),

    Marker(
      markerId: MarkerId('24'),
      position: LatLng(43.6601444, -79.37430559),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Dixon Hall - School House',
        snippet: '349 George St',
      ),
    ),

    Marker(
      markerId: MarkerId('25'),
      position: LatLng(43.63919371, -79.4096766),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Eva\'s Phoenix',
        snippet: '11 Ordnance St',
      ),
    ),

    Marker(
      markerId: MarkerId('26'),
      position: LatLng(43.76334566, -79.36095347),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Eva\'s Place',
        snippet: '360 Lesmill Rd',
      ),
    ),

    Marker(
      markerId: MarkerId('27'),
      position: LatLng(43.77279569, -79.41474262),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Eva\'s Place - Satellite',
        snippet: '25 Canterbury Pl',
      ),
    ),

    Marker(
      markerId: MarkerId('28'),
      position: LatLng(43.77776972, -79.17291709),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Family Res - Gateway Inn',
        snippet: '4694 Kingston Rd',
      ),
    ),

    Marker(
      markerId: MarkerId('31'),
      position: LatLng(43.76067763, -79.19674075),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Family Residence',
        snippet: '4222 Kingston Rd',
      ),
    ),

    Marker(
      markerId: MarkerId('32'),
      position: LatLng(43.71563937, -79.46691371),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Fred Victor Centre - Bethlehem United',
        snippet: '1161 Caledonia Rd',
      ),
    ),

    Marker(
      markerId: MarkerId('33'),
      position: LatLng(43.65230693, -79.37396099),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Fred Victor Centre - Women\'s Shelter',
        snippet: '86 Lombard St',
      ),
    ),

    Marker(
      markerId: MarkerId('34'),
      position: LatLng(43.65644578, -79.36272226),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Good Shepherd Centre',
        snippet: '412 Queen St E',
      ),
    ),

    Marker(
      markerId: MarkerId('35'),
      position: LatLng(43.6566345, -79.36238285),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Good Shepherd Barrett House',
        snippet: '35 Sydenham St',
      ),
    ),

    Marker(
      markerId: MarkerId('36'),
      position: LatLng(43.65845163, -79.44326708),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Homes First Society - Savard\'s',
        snippet: '1322 Bloor St W',
      ),
    ),

    Marker(
      markerId: MarkerId('37'),
      position: LatLng(43.64072955, -79.4108674),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Homes First Society - Strachan House',
        snippet: '805A Wellington St W',
      ),
    ),

    Marker(
      markerId: MarkerId('38'),
      position: LatLng(43.71752977, -79.25800808),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Homes First Society - 3576 St. Clair Avenue East Shelter',
        snippet: '3576 St Clair Ave E',
      ),
    ),

    Marker(
      markerId: MarkerId('39'),
      position: LatLng(43.68943588, -79.46260905),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Horizons for Youth',
        snippet: '422 Gilbert Ave',
      ),
    ),

    Marker(
      markerId: MarkerId('40'),
      position: LatLng(43.65847332, -79.40881392),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Native Child & Family Eagle\'s Nest Transition House',
        snippet: '558 Bathurst St',
      ),
    ),

    Marker(
      markerId: MarkerId('41'),
      position: LatLng(43.68145599, -79.41825445),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Native Men\'s Residence',
        snippet: '14 Vaughan Rd',
      ),
    ),

    Marker(
      markerId: MarkerId('42'),
      position: LatLng(43.66061351, -79.37147837),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Robertson House',
        snippet: '291 Sherbourne St',
      ),
    ),

    Marker(
      markerId: MarkerId('43'),
      position: LatLng(43.68183412, -79.41887244),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Sagatay',
        snippet: '26 Vaughan Rd',
      ),
    ),

    Marker(
      markerId: MarkerId('44'),
      position: LatLng(43.66566494, -79.46320469),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Salvation Army - Evangeline',
        snippet: '2808 Dundas St W',
      ),
    ),

    Marker(
      markerId: MarkerId('45'),
      position: LatLng(43.6465257, -79.40627994),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Salvation Army - Florence Booth',
        snippet: '723 Queen St W',
      ),
    ),

    Marker(
      markerId: MarkerId('46'),
      position: LatLng(43.6523228, -79.37247726),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Salvation Army - Gateway',
        snippet: '107 Jarvis St',
      ),
    ),

    Marker(
      markerId: MarkerId('47'),
      position: LatLng(43.65889989, -79.3935818),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Salvation Army - Hope',
        snippet: '167 College St',
      ),
    ),

    Marker(
      markerId: MarkerId('48'),
      position: LatLng(43.65524343, -79.36912884),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Salvation Army - Maxwell Meighen',
        snippet: '135 Sherbourne St',
      ),
    ),

    Marker(
      markerId: MarkerId('49'),
      position: LatLng(43.65869418, -79.40081069),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Scott Mission',
        snippet: '502 Spadina Ave',
      ),
    ),

    Marker(
      markerId: MarkerId('50'),
      position: LatLng(43.65995605, -79.37426518),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Seaton House Main Site',
        snippet: '339 George St',
      ),
    ),

    Marker(
      markerId: MarkerId('51'),
      position: LatLng(43.69152342, -79.26399139),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Seaton House/Birchmount Residence',
        snippet: '1673 Kingston Rd',
      ),
    ),

    Marker(
      markerId: MarkerId('52'),
      position: LatLng(43.77429788, -79.3493975),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Seaton House/Downsview Dells',
        snippet: '1651 Sheppard Ave E',
      ),
    ),

    Marker(
      markerId: MarkerId('53'),
      position: LatLng(43.6411163, -79.40267349),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Seaton House/Fort York',
        snippet: '38 Bathurst St',
      ),
    ),

    Marker(
      markerId: MarkerId('54'),
      position: LatLng(43.72826057, -79.26657716),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Second Base Youth Shelter',
        snippet: '702 Kennedy Rd',
      ),
    ),

    Marker(
      markerId: MarkerId('55'),
      position: LatLng(43.65459843, -79.36671075),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'MUC Shelter Corp. (Sojourn House)',
        snippet: '101 Ontario St',
      ),
    ),

    Marker(
      markerId: MarkerId('56'),
      position: LatLng(43.67200285, -79.37397078),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'St. Simon\'s',
        snippet: '525 Bloor St E',
      ),
    ),

    Marker(
      markerId: MarkerId('57'),
      position: LatLng(43.66282759, -79.33858864),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'St. Vincent De Paul - Amelie House',
        snippet: '126 Pape Ave',
      ),
    ),

    Marker(
      markerId: MarkerId('58'),
      position: LatLng(43.61821488, -79.49730746),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'St. Vincent De Paul - Elisa House',
        snippet: '60 Newcastle St',
      ),
    ),
]);